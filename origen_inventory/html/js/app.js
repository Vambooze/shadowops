var InventoryOption = '0, 0 ,0';
const debug = false;

var totalWeight = 0;
var totalWeightOther = 0;

var playerMaxWeight = 0;
var otherMaxWeight = 0;

var otherLabel = '';

var ClickedItemData = {};

var SelectedAttachment = null;
var AttachmentScreenActive = false;
var ControlPressed = false;
var disableRightMouse = false;
var selectedItem = null;

var IsDragging = false;

var a = 3;

// var over_button = document.getElementById("over_button");
var weapon_info = document.getElementById('weapon_info');
// over_button.volume = 0.03;

let frecuenciaActual;

let animOut = false;
let timeOut;
let actualRadio = '';
var translations = null;

let mini = true;
var cancelledTimer = null;
const click = new Audio('sounds/click.mp3');
const s_over = new Audio('sounds/over.wav');
const open_sound = new Audio('sounds/transition.ogg');
click.volume = 0.07;
s_over.volume = 0.1;
open_sound.volume = 0.2;

const debuger = (...args) =>{
	if (debug) console.log('^1[ORIGEN INVENTORY]:NUI^0',...args)
}
// GET TRANSLATE
let translate;

//  when $(document).ready does not work, comment and activate this function
// (async()=>{
// 	try {
//         translate = await $.post('https://origen_inventory/GetTranslate', {});
//         updateTranslations(translate);
//     } catch (error) {
// 		debuger(JSON.stringify(error));
//     }
	
// })()

$(document).ready(()=>{
	debuger('^2 document ready')
	loadtranslations();
})

async function  loadtranslations() {
	try {
        translate = await $.post('https://origen_inventory/GetTranslate', {});
        updateTranslations(translate);
		debuger('^2 translate ready')
    } catch (error) {
		debuger('^3[error]:^0',JSON.stringify(error));
    }
}

/**
 * Updates the translations for elements with the 'translate' attribute.
 *
 * @param {object} translate - The translation object.
 * @return {void} This function does not return a value.
 */

function updateTranslations(translate) {
    const elementsToTranslate = document.querySelectorAll('[translate]');
    elementsToTranslate.forEach(element => {
        const key = element.getAttribute('translate');
        if (translate?.hasOwnProperty(key)) {
            if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA') {
                element.setAttribute('placeholder', translate[key]);
            } else {
                element.textContent = translate[key];
            }
        }
    });
}

function checkTranslate() {
	if (translate === null) {
		console.log('Translate is null');
		loadtranslations()
		return false;
	} else {
		return true;
	}
}




/* $(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27: // ESC
            Inventory.Close();
            break;
    }
}); */

$(document).on('dblclick', '.item-slot', function (e) {
	var ItemData = $(this).data('item');
	var ItemInventory = $(this).parent().attr('data-inventory');
	if (ItemData) {
		if (ItemData.name == 'cash') return 
		Inventory.Close();
		$.post(
			'https://origen_inventory/UseItem',
			JSON.stringify({
				inventory: ItemInventory,
				item: ItemData
			})
		);
	}
});

$(document).on('keyup', function () {
	switch (event.keyCode) {
		case 112: // ESC
			Inventory.Close();
			ControlPressed = false;
			break;
	}
});

$(document).on('mouseenter', '.item-slot', function (e) {
	e.preventDefault();

	if ($(this).data('item') != null) {
		// console.log($(this).offset().left);
		let top = $(this).offset().top + 'px';
		let left = $(this).offset().left - $(this).outerWidth() * 3 + 'px';
		let slot = $(this).data('slot');

		$('.ply-iteminfo-container').fadeIn(0);
		$('.ply-iteminfo-container').css('top', top);
		$('.ply-iteminfo-container').css('left', 'calc(' + left + ' - 1vh)');

		FormatItemInfo($(this).data('item'));
	}
});

$(document).on('mouseleave', '.item-slot, .item-money', function (e) {
	e.preventDefault();
	$('.ply-iteminfo-container').fadeOut(0);
});

// Autostack Quickmove
function GetFirstFreeSlot($toInv, $fromSlot) {
	var retval = null;
	$.each($toInv.find('.item-slot'), function (i, slot) {
		if ($(slot).data('item') === undefined) {
			if (
				retval === null &&
				!($toInv.attr('data-inventory') == 'player' && i + 1 <= 5)
			) {
				retval = i + 1;
			}
		}
	});
	return retval;
}

function CanQuickMove() {
	var otherinventory = otherLabel.toLowerCase();
	var retval = true;
	// if (otherinventory == "grond") {
	//     retval = false
	// } else if (otherinventory.split("-")[0] == "dropped") {
	//     retval = false;
	// }
	if (otherinventory.split('-')[0] == 'player') {
		retval = false;
	}
	return retval;
}

$(document).on('click', '.item-slot', function () {
	if ($('.combine-option-container').css('display') == 'block') {
		$('.combine-option-container').fadeOut(300);
	}
});

$(document).on('mousedown', '.item-slot', function (event) {
	switch (event.which) {
		case 3:
			if (!event.shiftKey) {
				fromSlot = $(this).attr('data-slot');
				fromInventory = $(this).parent();

				if ($(fromInventory).attr('data-inventory') == 'player') {
					toInventory = $('.other-inventory');
				} else {
					toInventory = $('.player-inventory');
				}
				toSlot = GetFirstFreeSlot(toInventory, $(this));
				if ($(this).data('item') === undefined) {
					return;
				}

				toAmount = $(this).data('item').amount;

				if ($('#item-amount').val() != 0) {
					toAmount = $('#item-amount').val();
				}
				if (CanQuickMove()) {
					if (toSlot === null) {
						InventoryError(fromInventory, fromSlot);
						return;
					}
					if (fromSlot == toSlot && fromInventory.attr('data-inventory') == toInventory.attr('data-inventory')) {
						return;
					}

					if (toAmount >= 0) {
						swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
					}
				} else {
					InventoryError(fromInventory, fromSlot);
				}
				break;
			} else if ($($(this).parent()).attr('data-inventory') == 'player') {
				fromInventory = $(this).parent();
				fromSlot = $(this).attr('data-slot');

				toInventory = $(this).parent();
				toSlot = null;

				if (fromSlot > 5) {
					$.each(toInventory.find('.item-slot'), function (i, slot) {
						if ($(slot).data('item') === undefined) {
							if (!toSlot) {
								toSlot = i + 1;
								if (toSlot > 5) {
									toSlot = null;
								}
							}
						}
					});
					if (!toSlot) {
						InventoryError(fromInventory, fromSlot);
						return;
					}
				} else {
					$.each(toInventory.find('.item-slot'), function (i, slot) {
						if ($(slot).data('item') === undefined) {
							if (!toSlot) {
								toSlot = i + 1;
								if (toSlot <= 5) {
									toSlot = null;
								}
							}
						}
					});
					if (!toSlot) {
						InventoryError(fromInventory, fromSlot);
						return;
					}
				}

				toAmount = $(this).data('item').amount;
				if ($('#item-amount').val() != 0) {
					toAmount = $('#item-amount').val();
				}

				swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
			}
	}
});

$(document).on('click', '.item-slot', function (e) {
	e.preventDefault();
	var ItemData = $(this).data('item');

	if (ItemData !== null && ItemData !== undefined) {
		if (ItemData.name !== undefined) {
			if (ItemData.name.split('_')[0] == 'weapon') {
				if (!$('#weapon-attachments').length) {
					// if (ItemData.info.attachments !== null && ItemData.info.attachments !== undefined && ItemData.info.attachments.length > 0) {
					// $(".player-inv-info").append('<div class="inv-option-item" id="weapon-attachments"><p><i class="fas fa-search"></i> Información</p></div>');
					// $("#weapon-attachments").hide().fadeIn(300);
					// weapon_info.play();
					ClickedItemData = ItemData;
					// }
				} else if (ClickedItemData == ItemData) {
					// $("#weapon-attachments").fadeOut(250, function() {
					//     $("#weapon-attachments").remove();
					// });
					ClickedItemData = {};
				} else {
					ClickedItemData = ItemData;
				}
			} else {
				ClickedItemData = {};
				if ($('#weapon-attachments').length) {
					// $("#weapon-attachments").fadeOut(250, function() {
					//     $("#weapon-attachments").remove();
					// });
				}
			}
		} else {
			ClickedItemData = {};
			if ($('#weapon-attachments').length) {
				// $("#weapon-attachments").fadeOut(250, function() {
				//     $("#weapon-attachments").remove();
				// });
			}
		}
	} else {
		ClickedItemData = {};
		if ($('#weapon-attachments').length) {
			// $("#weapon-attachments").fadeOut(250, function() {
			//     $("#weapon-attachments").remove();
			// });
		}
	}
});

// $(document).on('click', '.weapon-attachments-back', function(e) {
//     e.preventDefault();
//     click.play();
//     $("#qbus-inventory").css({ "display": "block" });
//     $("#qbus-inventory").animate({
//         left: 0 + "vw"
//     }, 200);
//     $(".weapon-attachments-container").animate({
//         left: -100 + "vw"
//     }, 200, function() {
//         $(".weapon-attachments-container").css({ "display": "none" });
//     });
//     AttachmentScreenActive = false;
// });

function FormatAttachmentInfo(data) {
	$.post(
		'https://origen_inventory/GetWeaponData',
		JSON.stringify({
			weapon: data.name,
			ItemData: ClickedItemData
		}),
		function (data) {
			var AmmoLabel = '9mm';
			var Durability = 100;
			if (data.WeaponData.ammotype == 'AMMO_RIFLE') {
				AmmoLabel = '7.62';
			} else if (data.WeaponData.ammotype == 'AMMO_SHOTGUN') {
				AmmoLabel = '12 Gauge';
			}
			if (ClickedItemData.info.quality !== undefined) {
				Durability = ClickedItemData.info.quality;
			}

			$('.weapon-attachments-container-title').html(
				data.WeaponData.label + ' | ' + AmmoLabel
			);
			$('.weapon-attachments-container-description').html(
				data.WeaponData.description
			);
			$('.weapon-attachments-container-details').html(
				'<span style="font-weight: bold; letter-spacing: .1vh;">Nº de Serie</span><br> ' +
					ClickedItemData.info.serie +
					'<br><br><span style="font-weight: bold; letter-spacing: .1vh;">Durabilidad (' +
					Durability.toFixed() +
					'%) </span> <div class="weapon-attachments-container-detail-durability"><div class="weapon-attachments-container-detail-durability-total"></div></div>'
			);
			$('.weapon-attachments-container-detail-durability-total').css({
				width: Durability + '%'
			});
			$('.weapon-attachments-container-image').attr(
				'src',
				'./attachment_images/' + data.WeaponData.name + '.png'
			);
			$('.weapon-attachments').html('');

			if (data.AttachmentData !== null && data.AttachmentData !== undefined) {
				if (data.AttachmentData.length > 0) {
					$('.weapon-attachments-title').html(
						'<span style="font-weight: bold; letter-spacing: .1vh;">Attachments</span>'
					);
					$.each(data.AttachmentData, function (i, attachment) {
						var WeaponType = data.WeaponData.ammotype
							.split('_')[1]
							.toLowerCase();
						$('.weapon-attachments').append(
							'<div class="weapon-attachment" id="weapon-attachment-' +
								i +
								'"> <div class="weapon-attachment-label"><p>' +
								attachment.label +
								'</p></div> <div class="weapon-attachment-img"><img src="./images/' +
								WeaponType +
								'_' +
								attachment.attachment +
								'.png"></div> </div>'
						);
						attachment.id = i;
						$('#weapon-attachment-' + i).data('AttachmentData', attachment);
					});
				} else {
					$('.weapon-attachments-title').html(
						'<span style="font-weight: bold; letter-spacing: .1vh;">Este arma no tiene componentes añadidos.</span>'
					);
				}
			} else {
				$('.weapon-attachments-title').html(
					'<span style="font-weight: bold; letter-spacing: .1vh;">Este arma no tiene componentes añadidos.</span>'
				);
			}
		}
	);
}

var AttachmentDraggingData = {};

function FormatItemInfo(itemData) {
	if (itemData != null && itemData.info != '') {
		if (itemData.name == 'id_card') {
			var gender = translations['Man'];
			if (itemData.info.gender == 1) {
				gender = translations['Woman'];
			}
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(
				'<p><strong>CSN: </strong><span>' +
					itemData.info.citizenid +
					`</span></p><p><strong>${translations['FirstName']}: </strong><span>` +
					itemData.info.firstname +
					`</span></p><p><strong>${translations['LastName']}: </strong><span>` +
					itemData.info.lastname +
					`</span></p><p><strong>${translations['Birthday']}: </strong><span>` +
					itemData.info.birthdate +
					`</span></p><p><strong>${translations['Gender']}: </strong><span>` +
					gender +
					`</span></p><p><strong>${translations['Nacionality']}: </strong><span>` +
					itemData.info.nationality +
					'</span></p>'
			);
		} else if (itemData.name == 'driver_license') {
			var gender = translations['Man'];
			if (itemData.info.gender == 1) {
				gender = translations['Woman'];
			}
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(
				`<p><strong>${translations['FirstName']}: </strong><span>` +
					itemData.info.firstname +
					`</span></p><p><strong>${translations['LastName']}: </strong><span>` +
					itemData.info.lastname +
					`</span></p><p><strong>${translations['Birthday']}: </strong><span>` +
					itemData.info.birthdate +
					`</span></p><p><strong>${translations['Gender']}: </strong><span>` +
					gender +
					`</span></p>`
			);
		} else if (itemData.name == 'lawyerpass') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(
				'<p><strong>Pass-ID: </strong><span>' +
					itemData.info.id +
					`</span></p><p><strong>${translations['FirstName']}: </strong><span>` +
					itemData.info.firstname +
					`</span></p><p><strong>${translations['LastName']}: </strong><span>` +
					itemData.info.lastname +
					'</span></p><p><strong>CSN: </strong><span>' +
					itemData.info.citizenid +
					'</span></p>'
			);
		} else if (itemData.name == 'harness') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(
				'<p>' + itemData.info.uses + ' uses left.</p>'
			);
		} else if (itemData.type == 'weapon') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			if (itemData.info.ammo == undefined) {
				itemData.info.ammo = 0;
			} else {
				itemData.info.ammo != null ? itemData.info.ammo : 0;
			}
			if (itemData.info.attachments != null) {
				var attachmentString = '';
				$.each(itemData.info.attachments, function (i, attachment) {
					if (i == itemData.info.attachments.length - 1) {
						attachmentString += attachment.label;
					} else {
						attachmentString += attachment.label + ', ';
					}
				});
				$('.item-info-description').html(`
                <div class="weapon-desc-info">
                    <p>
                        <strong>
                            ${translations['SerialNumber']}:
                        </strong>
                        <span>${itemData.info.serie}</span>
                    </p>
                    <p>
                    <strong>${translations['Ammo']}: </strong>
                        <span>${itemData.info.ammo}</span>
                    </p>
                </div>
                <p>
                <strong>${translations['Accesories']}: </strong>
                <span>${attachmentString}</span>
                </p>`);
			} else {
				$('.item-info-description').html(`
                <div class="weapon-desc-info">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <img src="https://i.imgur.com/Vr0Nd4Z.png" style="width:2vh;">
                            <div class="weapon-number">${itemData.info.serie}</div>
                        </div>
                        <div class="d-flex align-items-center">
                        <img src="https://i.imgur.com/jI57Qhp.png" style="width:1.8vh;margin-right:.5vh">
                        <span class="bullets">${itemData.info.ammo}</span>
                        </div>
                    </div>

                </div>
                <p>${itemData.description}</p>`);
			}
		} else if (itemData.info.costs != undefined && itemData.info.costs != null) {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html('<p>' + itemData.info.costs + '</p>');
		} else if (itemData.name == "stickynote") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>' + itemData.info.label + '</p>');
        } else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Name: </strong><span>'+ itemData.info.firstname + '</span></p><p><strong>Last Name: </strong><span>'+ itemData.info.lastname+ '</span></p><p><strong>Plate: </strong><span>'+ itemData.info.plate + '<p><strong>Model: </strong><span>'+ itemData.info.model +'</span></p>');
		} else if (itemData.name == 'stickynotespack') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(
				`<p><strong>${translations['RemaingNotes']}: </strong>` +
					itemData.info.notes +
					'</p>'
			);
		} else if (itemData.name == 'moneybag') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(
				`<p><strong>${translations['EfectiveQuantity']}: </strong><span>$` +
					itemData.info.cash +
					'</span></p>'
			);
		} else if (itemData.name == 'markedbills') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(`<p>${translations['MarkedMoney']}</p>`);
		} else if (itemData.name == 'labkey') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html('<p>Lab: ' + itemData.info.lab + '</p>');
		} else if (itemData.name == 'placa_lspd' || itemData.name == 'placa_bcsd') {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			$('.item-info-description').html(
				'<p><strong>Rango: </strong><span>' +
					itemData.info.grade +
					'</span></p><p><strong>Nº Placa: </strong><span>' +
					itemData.info.n +
					'</span></p>'
			);
		} else {
			$('.item-info-title').html('<p>' + itemData.label + '</p>');
			if (itemData.info.serie) {
				$('.item-info-description').html(
					'<p>' +
						itemData.description +
						'</p><b>Nº Serie: </b>' +
						itemData.info.serie
				);
				return;
			}
			$('.item-info-description').html('<p>' + itemData.description + '</p>');
		}
	} else {
		$('.item-info-title').html('<p>' + itemData.label + '</p>');
		$('.item-info-description').html('<p>' + itemData.description + '</p>');
	}
}

function handleDragDrop() {
	var inUse = {
		use: false,
		give: false
	};
	$('.item-drag').draggable({
		helper: 'clone',
		appendTo: 'body',
		scroll: false,
		revertDuration: 500,
		revert: 'invalid',
		cancel: '.item-nodrag',
		start: function (event, ui) {
			IsDragging = true;
			// $(this).css("background", "rgba(20,20,20,1.0)");
			$(this).find('img').css('filter', 'brightness(50%)');
			$('.ply-iteminfo-container').fadeOut(100);
			// $(".item-slot").css("border", "1px solid rgba(255, 255, 255, 0.1)")

			var itemData = $(this).data('item');
			var dragAmount = $('#item-amount').val();
			if (!itemData.useable) {
				$('#item-use').css('background', 'rgba(35,35,35, 0.5');
			}

			if (dragAmount == 0) {
				if (itemData.price != null) {
					//$(this).find(".item-slot-amount p").html('0 (0.0)');
					$('.ui-draggable-dragging')
						.find('.item-slot-amount p')
						.html('$' + itemData.price);
					$('.ui-draggable-dragging').find('.item-slot-key').remove();
					if ($(this).parent().attr('data-inventory') == 'hotbar') {
					}
				} else {
					//$(this).find(".item-slot-amount p").html('0 (0.0)');
					$('.ui-draggable-dragging')
						.find('.item-slot-amount p')
						.html(
							itemData.amount /*+ ' (' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')'*/
						);
					$('.ui-draggable-dragging').find('.item-slot-key').remove();
					if ($(this).parent().attr('data-inventory') == 'hotbar') {
					}
				}
			} else if (dragAmount > itemData.amount) {
				if (itemData.price != null) {
					$(this)
						.find('.item-slot-amount p')
						.html('$' + itemData.price);
					if ($(this).parent().attr('data-inventory') == 'hotbar') {
					}
				} else {
					$(this)
						.find('.item-slot-amount p')
						.html(
							itemData.amount /*+ ' (' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')'*/
						);
					if ($(this).parent().attr('data-inventory') == 'hotbar') {
					}
				}
				InventoryError($(this).parent(), $(this).attr('data-slot'));
			} else if (dragAmount > 0) {

			} else {
				if ($(this).parent().attr('data-inventory') == 'hotbar') {
				}

				$('.ui-draggable-dragging').find('.item-slot-key').remove();
				$(this)
					.find('.item-slot-amount p')
					.html(
						itemData.amount /*+ ' (' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')'   */
					);
				InventoryError($(this).parent(), $(this).attr('data-slot'));
			}
		},
		stop: function (event, ui) {
			setTimeout(function () {
				IsDragging = false;
			}, 300);
			$(this).css('background', 'rgba(0, 0, 0)');
			$(this).find('img').css('filter', 'brightness(100%)');
			$('#item-use').css('background', 'rgba(' + InventoryOption + ')');
		}
	});

	$('.item-slot').droppable({
		hoverClass: 'item-slot-hoverClass',
		drop: function (event, ui) {
			setTimeout(function () {
				IsDragging = false;
			}, 300);
			fromSlot = ui.draggable.attr('data-slot');
			fromInventory = ui.draggable.parent();
			toSlot = $(this).attr('data-slot');
			toInventory = $(this).parent();
			toAmount = $('#item-amount').val();

			if (toInventory.attr('data-inventory') == "player" && !isSlotVisible($(this).parent(), $(this))) {
				return;
			}

			if (fromSlot == toSlot && fromInventory.attr('data-inventory') == toInventory.attr('data-inventory')) {
				return;
			}

			if (toAmount >= 0) {
				swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
			}
		}
	});
}

function isSlotVisible(contenedor, elemento) {
	var contenedorRect = contenedor[0].getBoundingClientRect();
	var elementoRect = elemento[0].getBoundingClientRect();
  
	var estaDentroHorizontalmente = elementoRect.left >= contenedorRect.left && elementoRect.right <= contenedorRect.right;
  
	var estaDentroVerticalmente = elementoRect.top >= contenedorRect.top && elementoRect.bottom <= contenedorRect.bottom;
  
	if (estaDentroHorizontalmente && estaDentroVerticalmente) {
	  	return true;
	} else {
	  	return false;
	}
}

var combineslotData = null;

$(document).on('click', '.CombineItem', function (e) {
	e.preventDefault();
	if (combineslotData.toData.combinable.anim != null) {
		$.post(
			'https://origen_inventory/combineWithAnim',
			JSON.stringify({
				combineData: combineslotData.toData.combinable,
				usedItem: combineslotData.toData.name,
				requiredItem: combineslotData.fromData.name
			})
		);
	} else {
		$.post(
			'https://origen_inventory/combineItem',
			JSON.stringify({
				reward: combineslotData.toData.combinable.reward,
				toItem: combineslotData.toData.name,
				fromItem: combineslotData.fromData.name
			})
		);
	}
	Inventory.Close();
});

$(document).on('click', '.SwitchItem', function (e) {
	e.preventDefault();
	$('.combine-option-container').hide();

	optionSwitch(
		combineslotData.fromSlot,
		combineslotData.toSlot,
		combineslotData.fromInv,
		combineslotData.toInv,
		combineslotData.toAmount,
		combineslotData.toData,
		combineslotData.fromData
	);
});

function optionSwitch($fromSlot, $toSlot, $fromInv, $toInv, $toAmount, toData, fromData) {
	fromData.slot = parseInt($toSlot);

	$toInv.find('[data-slot=' + $toSlot + ']').data('item', fromData);

	$toInv.find('[data-slot=' + $toSlot + ']').addClass('item-drag');
	$toInv.find('[data-slot=' + $toSlot + ']').removeClass('item-nodrag');

	if ($toSlot < 6) {
		var isValid = validURL(fromData.image);
		if (isValid) {
			$toInv
				.find('[data-slot=' + $toSlot + ']')
				.html(
					'<div class="item-slot-key"><p>' +
						$toSlot +
						'</p></div><div class="item-slot-img"><img src="' +
						fromData.image +
						'" alt="' +
						fromData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						fromData.amount +
						'</p></div>'
				);
		} else {
			$toInv
				.find('[data-slot=' + $toSlot + ']')
				.html(
					'<div class="item-slot-key"><p>' +
						$toSlot +
						'</p></div><div class="item-slot-img"><img src=images/"' +
						fromData.image +
						'" alt="' +
						fromData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						fromData.amount +
						'</p></div>'
				);
		}
	} else {
		var isValid = validURL(fromData.image);
		if (isValid) {
			$toInv
				.find('[data-slot=' + $toSlot + ']')
				.html(
					'<div class="item-slot-img"><img src="' +
						fromData.image +
						'" alt="' +
						fromData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						fromData.amount +
						'</p></div><div class="item-slot-label"><p>' +
						fromData.label +
						'</p></div>'
				);
		} else {
			$toInv
				.find('[data-slot=' + $toSlot + ']')
				.html(
					'<div class="item-slot-img"><img src="images/' +
						fromData.image +
						'" alt="' +
						fromData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						fromData.amount +
						'</p></div><div class="item-slot-label"><p>' +
						fromData.label +
						'</p></div>'
				);
		}
	}

	toData.slot = parseInt($fromSlot);

	$fromInv.find('[data-slot=' + $fromSlot + ']').addClass('item-drag');
	$fromInv.find('[data-slot=' + $fromSlot + ']').removeClass('item-nodrag');

	$fromInv.find('[data-slot=' + $fromSlot + ']').data('item', toData);

	if ($fromSlot < 6) {
		var isValid = validURL(toData.image);
		if (isValid) {
			$fromInv
				.find('[data-slot=' + $fromSlot + ']')
				.html(
					'<div class="item-slot-key"><p>' +
						$fromSlot +
						'</p></div><div class="item-slot-img"><img src="' +
						toData.image +
						'" alt="' +
						toData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						toData.amount +
						' </p></div>'
				);
		} else {
			$fromInv
				.find('[data-slot=' + $fromSlot + ']')
				.html(
					'<div class="item-slot-key"><p>' +
						$fromSlot +
						'</p></div><div class="item-slot-img"><img src="images/' +
						toData.image +
						'" alt="' +
						toData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						toData.amount +
						' </p></div>'
				);
		}
	} else {
		var isValid = validURL(toData.image);
		if (isValid) {
			$fromInv
				.find('[data-slot=' + $fromSlot + ']')
				.html(
					'<div class="item-slot-img"><img src="' +
						toData.image +
						'" alt="' +
						toData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						toData.amount +
						'</p></div><div class="item-slot-label"><p>' +
						toData.label +
						'</p></div>'
				);
		} else {
			$fromInv
				.find('[data-slot=' + $fromSlot + ']')
				.html(
					'<div class="item-slot-img"><img src="images/' +
						toData.image +
						'" alt="' +
						toData.name +
						'" /></div><div class="item-slot-amount"><p>' +
						toData.amount +
						'</p></div><div class="item-slot-label"><p>' +
						toData.label +
						'</p></div>'
				);
		}
	}
	$.post(
		'https://origen_inventory/SetInventoryData',
		JSON.stringify({
			fromInventory: $fromInv.attr('data-inventory'),
			toInventory: $toInv.attr('data-inventory'),
			fromSlot: $fromSlot,
			toSlot: $toSlot,
			fromAmount: $toAmount,
			toAmount: toData.amount
		})
	);
}

function swap($fromSlot, $toSlot, $fromInv, $toInv, $toAmount) {
	fromData = $fromInv.find('[data-slot=' + $fromSlot + ']').data('item');
	toData = $toInv.find('[data-slot=' + $toSlot + ']').data('item');
	var otherinventory = otherLabel.toLowerCase();

	if (otherinventory.split('-')[0] == 'dropped') {
		if (toData !== null && toData !== undefined) {
			InventoryError($fromInv, $fromSlot);
			return;
		}
	}
	if ($toInv.attr('data-inventory') == 'origen_craft') {
		if (
			$toSlot == $('.other-inventory .item-slot').length ||
			($fromInv.attr('data-inventory') == 'origen_craft' &&
				$fromSlot == $('.other-inventory .item-slot').length)
		) {
			InventoryError($toInv, $toSlot);
			return;
		}
	}

	if (
		$fromInv.attr('data-inventory') == 'origen_craft' &&
		$fromSlot == $('.other-inventory .item-slot').length &&
		($toInv.attr('data-inventory') == 'player' ||
			$toInv.attr('data-inventory') == 'hotbar') &&
		$toInv.find('[data-slot=' + $toSlot + ']').hasClass('item-drag') &&
		(toData.name != fromData.name || toData.name.split('_')[0] == 'weapon')
	) {
		InventoryError($fromInv, $fromSlot);
		return;
	}

	if (fromData !== undefined && fromData.amount >= $toAmount) {
		if (
			($fromInv.attr('data-inventory') == 'player' ||
				$fromInv.attr('data-inventory') == 'hotbar') &&
			$toInv.attr('data-inventory').split('-')[0] == 'itemshop' &&
			$toInv.attr('data-inventory') == 'crafting'
		) {
			InventoryError($toInv, $toSlot);
			return;
		}

		if (
			$toAmount == 0 &&
			$fromInv.attr('data-inventory').split('-')[0] == 'itemshop' &&
			$fromInv.attr('data-inventory') == 'crafting'
		) {
			InventoryError($fromInv, $fromSlot);
			return;
		} else if ($toAmount == 0) {
			if (($fromInv.attr('data-inventory').split('-')[0] == 'itemshop')) {
				$toAmount = 1;
			} else {
				$toAmount = fromData.amount;
			}
		}
		if (
			(toData != undefined || toData != null) &&
			toData.name == fromData.name &&
			!fromData.unique
		) {
			var newData = [];
			newData.name = toData.name;
			newData.label = toData.label;
			newData.amount = parseInt($toAmount) + parseInt(toData.amount);
			newData.type = toData.type;
			newData.description = toData.description;
			newData.image = toData.image;
			newData.weight = toData.weight;
			newData.info = toData.info;
			newData.useable = toData.useable;
			newData.unique = toData.unique;
			newData.decayRate = toData.decayRate;
			newData.slot = parseInt($toSlot);

			if (fromData.amount == $toAmount) {
				$toInv.find('[data-slot=' + $toSlot + ']').data('item', newData);

				$toInv.find('[data-slot=' + $toSlot + ']').addClass('item-drag');
				$toInv.find('[data-slot=' + $toSlot + ']').removeClass('item-nodrag');

				var ItemLabel =
					'<div class="item-slot-label"><p>' + newData.label + '</p></div>';
				if (newData.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(newData.name)) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
								newData.label +
							'</p></div>';
					}
				}

				if (newData.decayRate) {
					ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
						newData.label +
						'</p></div>';
				}

				if ($toSlot < 6 && $toInv.attr('data-inventory') == 'player') {
					var isValid = validURL(newData.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'</p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="images/' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'</p></div>' +
									ItemLabel
							);
					}
				} else {
					var isValid = validURL(newData.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'</p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="images/' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'</p></div>' +
									ItemLabel
							);
					}
				}

				if (newData.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(newData.name)) {
						if (newData.info.quality == undefined) {
							newData.info.quality = 100.0;
						}
						var QualityColor = 'rgb(39, 174, 96)';
						if (newData.info.quality < 25) {
							QualityColor = 'rgb(192, 57, 43)';
						} else if (
							newData.info.quality > 25 &&
							newData.info.quality < 50
						) {
							QualityColor = 'rgb(230, 126, 34)';
						} else if (newData.info.quality >= 50) {
							QualityColor = 'rgb(39, 174, 96)';
						}
						if (newData.info.quality !== undefined) {
							qualityLabel = newData.info.quality.toFixed();
						} else {
							qualityLabel = newData.info.quality;
						}
						if (newData.info.quality == 0) {
							qualityLabel = 'Estropeada';
						}
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.find('.item-slot-quality-bar')
							.css({
								width: qualityLabel + '%',
								'background-color': QualityColor
							})
							.find('p')
							.html(qualityLabel);
					}
				}

				if (newData.decayRate) {
					if (newData.info.quality == undefined) {
						newData.info.quality = 100.0;
					}
					var QualityColor = 'rgb(39, 174, 96)';
					if (newData.info.quality < 25) {
						QualityColor = 'rgb(192, 57, 43)';
					} else if (newData.info.quality > 25 && newData.info.quality < 50) {
						QualityColor = 'rgb(230, 126, 34)';
					} else if (newData.info.quality >= 50) {
						QualityColor = 'rgb(39, 174, 96)';
					}
					if (newData.info.quality !== undefined) {
						qualityLabel = newData.info.quality.toFixed();
					} else {
						qualityLabel = newData.info.quality;
					}

					$toInv
						.find('[data-slot=' + $toSlot + ']')
						.find('.item-slot-quality-bar')
						.css({
							width: qualityLabel + '%',
							'background-color': QualityColor
						})
						.find('p')
						.html(qualityLabel);
				}

				$fromInv.find('[data-slot=' + $fromSlot + ']').removeClass('item-drag');
				$fromInv.find('[data-slot=' + $fromSlot + ']').addClass('item-nodrag');

				$fromInv.find('[data-slot=' + $fromSlot + ']').removeData('item');
				$fromInv
					.find('[data-slot=' + $fromSlot + ']')
					.html(
						'<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>'
					);
			} else if (fromData.amount > $toAmount) {
				var newDataFrom = [];
				newDataFrom.name = fromData.name;
				newDataFrom.label = fromData.label;
				newDataFrom.amount = parseInt(fromData.amount - $toAmount);
				newDataFrom.type = fromData.type;
				newDataFrom.description = fromData.description;
				newDataFrom.image = fromData.image;
				newDataFrom.weight = fromData.weight;
				newDataFrom.price = fromData.price;
				newDataFrom.info = fromData.info;
				newDataFrom.useable = fromData.useable;
				newDataFrom.unique = fromData.unique;
				newDataFrom.slot = parseInt($fromSlot);

				$toInv.find('[data-slot=' + $toSlot + ']').data('item', newData);

				$toInv.find('[data-slot=' + $toSlot + ']').addClass('item-drag');
				$toInv.find('[data-slot=' + $toSlot + ']').removeClass('item-nodrag');

				var ItemLabel =
					'<div class="item-slot-label"><p>' + newData.label + '</p></div>';
				if (newData.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(newData.name)) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
						newData.label +
							'</p></div>';
					}
				}

				if (newData.decayRate) {
					ItemLabel =
					'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
					newData.label +
						'</p></div>';
				}

				if ($toSlot < 6 && $toInv.attr('data-inventory') == 'player') {
					var isValid = validURL(newData.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'  </p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="images/' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'  </p></div>' +
									ItemLabel
							);
					}
				} else {
					var isValid = validURL(newData.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'  </p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="images/' +
									newData.image +
									'" alt="' +
									newData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newData.amount +
									'  </p></div>' +
									ItemLabel
							);
					}
				}

				if (newData.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(newData.name)) {
						if (newData.info.quality == undefined) {
							newData.info.quality = 100.0;
						}
						var QualityColor = 'rgb(39, 174, 96)';
						if (newData.info.quality < 25) {
							QualityColor = 'rgb(192, 57, 43)';
						} else if (
							newData.info.quality > 25 &&
							newData.info.quality < 50
						) {
							QualityColor = 'rgb(230, 126, 34)';
						} else if (newData.info.quality >= 50) {
							QualityColor = 'rgb(39, 174, 96)';
						}
						if (newData.info.quality !== undefined) {
							qualityLabel = newData.info.quality.toFixed();
						} else {
							qualityLabel = newData.info.quality;
						}
						if (newData.info.quality == 0) {
							qualityLabel = 'ROTO';
						}
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.find('.item-slot-quality-bar')
							.css({
								width: qualityLabel + '%',
								'background-color': QualityColor
							})
							.find('p')
							.html(qualityLabel);
					}
				}

				if (newData.decayRate) {
					if (newData.info.quality == undefined) {
						newData.info.quality = 100.0;
					}
					var QualityColor = 'rgb(39, 174, 96)';
					if (newData.info.quality < 25) {
						QualityColor = 'rgb(192, 57, 43)';
					} else if (newData.info.quality > 25 && newData.info.quality < 50) {
						QualityColor = 'rgb(230, 126, 34)';
					} else if (newData.info.quality >= 50) {
						QualityColor = 'rgb(39, 174, 96)';
					}
					if (newData.info.quality !== undefined) {
						qualityLabel = newData.info.quality.toFixed();
					} else {
						qualityLabel = newData.info.quality;
					}
					if (newData.info.quality == 0) {
						qualityLabel = 'ROTO';
					}
					$toInv
						.find('[data-slot=' + $toSlot + ']')
						.find('.item-slot-quality-bar')
						.css({
							width: qualityLabel + '%',
							'background-color': QualityColor
						})
						.find('p')
						.html(qualityLabel);
				}

				// From Data zooi
				$fromInv.find('[data-slot=' + $fromSlot + ']').data('item', newDataFrom);

				$fromInv.find('[data-slot=' + $fromSlot + ']').addClass('item-drag');
				$fromInv.find('[data-slot=' + $fromSlot + ']').removeClass('item-nodrag');

				if ($fromInv.attr('data-inventory').split('-')[0] == 'itemshop') {
					var isValid = validURL(newDataFrom.image);
					if (isValid) {
						$fromInv
							.find('[data-slot=' + $fromSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="' +
									newDataFrom.image +
									'" alt="' +
									newDataFrom.name +
									'" /></div><div class="item-slot-amount"><p>$' +
									newDataFrom.price +
									'</p></div><div class="item-slot-label"><p>' +
									newDataFrom.label +
									'</p></div>'
							);
					} else {
						$fromInv
							.find('[data-slot=' + $fromSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="images/' +
									newDataFrom.image +
									'" alt="' +
									newDataFrom.name +
									'" /></div><div class="item-slot-amount"><p>$' +
									newDataFrom.price +
									'</p></div><div class="item-slot-label"><p>' +
									newDataFrom.label +
									'</p></div>'
							);
					}
				} else {
					var ItemLabel =
						'<div class="item-slot-label"><p>' +
						newDataFrom.label +
						'</p></div>';
					if (newDataFrom.name.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
							ItemLabel =
							'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
									newDataFrom.label +
								'</p></div>';
						}
					}

					if (newDataFrom.decayRate) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
								newDataFrom.label +
							'</p></div>';
					}

					if ($fromSlot < 6 && $fromInv.attr('data-inventory') == 'player') {
						var isValid = validURL(newDataFrom.image);
						if (isValid) {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										$fromSlot +
										'</p></div><div class="item-slot-img"><img src="' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										$fromSlot +
										'</p></div><div class="item-slot-img"><img src="images/' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						}
					} else {
						var isValid = validURL(newDataFrom.image);
						if (isValid) {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-img"><img src="' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-img"><img src="images/' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						}
					}

					if (newDataFrom.name.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
							if (newDataFrom.info.quality == undefined) {
								newDataFrom.info.quality = 100.0;
							}
							var QualityColor = 'rgb(39, 174, 96)';
							if (newDataFrom.info.quality < 25) {
								QualityColor = 'rgb(192, 57, 43)';
							} else if (
								newDataFrom.info.quality > 25 &&
								newDataFrom.info.quality < 50
							) {
								QualityColor = 'rgb(230, 126, 34)';
							} else if (newDataFrom.info.quality >= 50) {
								QualityColor = 'rgb(39, 174, 96)';
							}
							if (newDataFrom.info.quality !== undefined) {
								qualityLabel = newDataFrom.info.quality.toFixed();
							} else {
								qualityLabel = newDataFrom.info.quality;
							}
							if (newDataFrom.info.quality == 0) {
								qualityLabel = 'ROTO';
							}
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.find('.item-slot-quality-bar')
								.css({
									width: qualityLabel + '%',
									'background-color': QualityColor
								})
								.find('p')
								.html(qualityLabel);
						}
					}

					if (newDataFrom.decayRate) {
						if (newDataFrom.info.quality == undefined) {
							newDataFrom.info.quality = 100.0;
						}
						var QualityColor = 'rgb(39, 174, 96)';
						if (newDataFrom.info.quality < 25) {
							QualityColor = 'rgb(192, 57, 43)';
						} else if (
							newDataFrom.info.quality > 25 &&
							newDataFrom.info.quality < 50
						) {
							QualityColor = 'rgb(230, 126, 34)';
						} else if (newDataFrom.info.quality >= 50) {
							QualityColor = 'rgb(39, 174, 96)';
						}
						if (newDataFrom.info.quality !== undefined) {
							qualityLabel = newDataFrom.info.quality.toFixed();
						} else {
							qualityLabel = newDataFrom.info.quality;
						}
						if (newDataFrom.info.quality == 0) {
							qualityLabel = 'ROTO';
						}
						$fromInv
							.find('[data-slot=' + $fromSlot + ']')
							.find('.item-slot-quality-bar')
							.css({
								width: qualityLabel + '%',
								'background-color': QualityColor
							})
							.find('p')
							.html(qualityLabel);
					}
				}
			}
			$.post('https://origen_inventory/PlayDropSound', JSON.stringify({}));
			$.post(
				'https://origen_inventory/SetInventoryData',
				JSON.stringify({
					fromInventory: $fromInv.attr('data-inventory'),
					toInventory: $toInv.attr('data-inventory'),
					fromSlot: $fromSlot,
					toSlot: $toSlot,
					fromAmount: $toAmount
				})
			);
		} else {
			if (fromData.amount == $toAmount) {
				if (
					toData != undefined &&
					toData.combinable != null &&
					isItemAllowed(fromData.name, toData.combinable.accept)
				) {
					$.post(
						'https://origen_inventory/getCombineItem',
						JSON.stringify({ item: toData.combinable.reward }),
						function (item) {
							$('.combine-option-text').html(
								'<p>Si combinas estos elementos, obtienes: <b>' +
									item.label +
									'</b></p>'
							);
						}
					);
					if ($('#weapon-attachments').css('display') == 'block') {
						$('#weapon-attachments').fadeOut(300, function () {
							$('.combine-option-container').fadeIn(300);
						});
					} else {
						$('.combine-option-container').fadeIn(300);
					}
					combineslotData = [];
					combineslotData.fromData = fromData;
					combineslotData.toData = toData;
					combineslotData.fromSlot = $fromSlot;
					combineslotData.toSlot = $toSlot;
					combineslotData.fromInv = $fromInv;
					combineslotData.toInv = $toInv;
					combineslotData.toAmount = $toAmount;
					return;
				}

				fromData.slot = parseInt($toSlot);

				$toInv.find('[data-slot=' + $toSlot + ']').data('item', fromData);

				$toInv.find('[data-slot=' + $toSlot + ']').addClass('item-drag');
				$toInv.find('[data-slot=' + $toSlot + ']').removeClass('item-nodrag');

				var ItemLabel =
					'<div class="item-slot-label"><p>' + fromData.label + '</p></div>';
				if (fromData.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(fromData.name)) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
								fromData.label +
							'</p></div>';
					}
				}

				if (fromData.decayRate) {
					ItemLabel =
					'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
							fromData.label +
						'</p></div>';
				}

				if ($toSlot < 6 && $toInv.attr('data-inventory') == 'player') {
					var isValid = validURL(fromData.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="' +
									fromData.image +
									'" alt="' +
									fromData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									fromData.amount +
									'</p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="images/' +
									fromData.image +
									'" alt="' +
									fromData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									fromData.amount +
									'</p></div>' +
									ItemLabel
							);
					}
				} else {
					var isValid = validURL(fromData.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="' +
									fromData.image +
									'" alt="' +
									fromData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									fromData.amount +
									'</p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="images/' +
									fromData.image +
									'" alt="' +
									fromData.name +
									'" /></div><div class="item-slot-amount"><p>' +
									fromData.amount +
									'</p></div>' +
									ItemLabel
							);
					}
				}

				if (fromData.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(fromData.name)) {
						if (fromData.info.quality == undefined) {
							fromData.info.quality = 100.0;
						}
						var QualityColor = 'rgb(39, 174, 96)';
						if (fromData.info.quality < 25) {
							QualityColor = 'rgb(192, 57, 43)';
						} else if (
							fromData.info.quality > 25 &&
							fromData.info.quality < 50
						) {
							QualityColor = 'rgb(230, 126, 34)';
						} else if (fromData.info.quality >= 50) {
							QualityColor = 'rgb(39, 174, 96)';
						}
						if (fromData.info.quality !== undefined) {
							qualityLabel = fromData.info.quality.toFixed();
						} else {
							qualityLabel = fromData.info.quality;
						}
						if (fromData.info.quality == 0) {
							qualityLabel = 'ROTO';
						}
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.find('.item-slot-quality-bar')
							.css({
								width: qualityLabel + '%',
								'background-color': QualityColor
							})
							.find('p')
							.html(qualityLabel);
					}
				}

				if (fromData.decayRate) {
					if (fromData.info.quality == undefined) {
						fromData.info.quality = 100.0;
					}
					var QualityColor = 'rgb(39, 174, 96)';
					if (fromData.info.quality < 25) {
						QualityColor = 'rgb(192, 57, 43)';
					} else if (fromData.info.quality > 25 && fromData.info.quality < 50) {
						QualityColor = 'rgb(230, 126, 34)';
					} else if (fromData.info.quality >= 50) {
						QualityColor = 'rgb(39, 174, 96)';
					}
					if (fromData.info.quality !== undefined) {
						qualityLabel = fromData.info.quality.toFixed();
					} else {
						qualityLabel = fromData.info.quality;
					}
					if (fromData.info.quality == 0) {
						qualityLabel = 'ROTO';
					}
					$toInv
						.find('[data-slot=' + $toSlot + ']')
						.find('.item-slot-quality-bar')
						.css({
							width: qualityLabel + '%',
							'background-color': QualityColor
						})
						.find('p')
						.html(qualityLabel);
				}
				if (toData != undefined) {
					toData.slot = parseInt($fromSlot);

					$fromInv.find('[data-slot=' + $fromSlot + ']').addClass('item-drag');
					$fromInv
						.find('[data-slot=' + $fromSlot + ']')
						.removeClass('item-nodrag');

					$fromInv.find('[data-slot=' + $fromSlot + ']').data('item', toData);

					var ItemLabel =
						'<div class="item-slot-label"><p>' + toData.label + '</p></div>';
					if (toData.name.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(toData.name)) {
							ItemLabel =
							'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
							toData.label +
								'</p></div>';
						}
					}

					if (toData.decayRate) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
								toData.label +
							'</p></div>';
					}

					if ($fromSlot < 6 && $fromInv.attr('data-inventory') == 'player') {
						var isValid = validURL(toData.image);
						if (isValid) {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										$fromSlot +
										'</p></div><div class="item-slot-img"><img src="' +
										toData.image +
										'" alt="' +
										toData.name +
										'" /></div><div class="item-slot-amount"><p>' +
										toData.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										$fromSlot +
										'</p></div><div class="item-slot-img"><img src="images/' +
										toData.image +
										'" alt="' +
										toData.name +
										'" /></div><div class="item-slot-amount"><p>' +
										toData.amount +
										'</p></div>' +
										ItemLabel
								);
						}
					} else {
						var isValid = validURL(toData.image);
						if (isValid) {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-img"><img src="images/' +
										toData.image +
										'" alt="' +
										toData.name +
										'" /></div><div class="item-slot-amount"><p>' +
										toData.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-img"><img src="images/' +
										toData.image +
										'" alt="' +
										toData.name +
										'" /></div><div class="item-slot-amount"><p>' +
										toData.amount +
										'</p></div>' +
										ItemLabel
								);
						}
					}

					if (toData.name.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(toData.name)) {
							if (toData.info.quality == undefined) {
								toData.info.quality = 100.0;
							}
							var QualityColor = 'rgb(39, 174, 96)';
							if (toData.info.quality < 25) {
								QualityColor = 'rgb(192, 57, 43)';
							} else if (
								toData.info.quality > 25 &&
								toData.info.quality < 50
							) {
								QualityColor = 'rgb(230, 126, 34)';
							} else if (toData.info.quality >= 50) {
								QualityColor = 'rgb(39, 174, 96)';
							}
							if (toData.info.quality !== undefined) {
								qualityLabel = toData.info.quality.toFixed();
							} else {
								qualityLabel = toData.info.quality;
							}
							if (toData.info.quality == 0) {
								qualityLabel = 'ROTO';
							}
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.find('.item-slot-quality-bar')
								.css({
									width: qualityLabel + '%',
									'background-color': QualityColor
								})
								.find('p')
								.html(qualityLabel);
						}
					}
					$.post(
						'https://origen_inventory/SetInventoryData',
						JSON.stringify({
							fromInventory: $fromInv.attr('data-inventory'),
							toInventory: $toInv.attr('data-inventory'),
							fromSlot: $fromSlot,
							toSlot: $toSlot,
							fromAmount: $toAmount,
							toAmount: toData.amount
						})
					);
				} else {
					$fromInv
						.find('[data-slot=' + $fromSlot + ']')
						.removeClass('item-drag');
					$fromInv
						.find('[data-slot=' + $fromSlot + ']')
						.addClass('item-nodrag');

					$fromInv.find('[data-slot=' + $fromSlot + ']').removeData('item');

					if ($fromSlot < 6 && $fromInv.attr('data-inventory') == 'player') {
						$fromInv
							.find('[data-slot=' + $fromSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$fromSlot +
									'</p></div><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>'
							);
					} else {
						$fromInv
							.find('[data-slot=' + $fromSlot + ']')
							.html(
								'<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>'
							);
					}
					$.post(
						'https://origen_inventory/SetInventoryData',
						JSON.stringify({
							fromInventory: $fromInv.attr('data-inventory'),
							toInventory: $toInv.attr('data-inventory'),
							fromSlot: $fromSlot,
							toSlot: $toSlot,
							fromAmount: $toAmount,
						})
					);
				}
				$.post('https://origen_inventory/PlayDropSound', JSON.stringify({}));
			} else if (
				fromData.amount > $toAmount &&
				(toData == undefined || toData == null)
			) {
				var newDataTo = [];
				newDataTo.name = fromData.name;
				newDataTo.label = fromData.label;
				newDataTo.amount = parseInt($toAmount);
				newDataTo.type = fromData.type;
				newDataTo.description = fromData.description;
				newDataTo.image = fromData.image;
				newDataTo.weight = fromData.weight;
				newDataTo.info = fromData.info;
				newDataTo.useable = fromData.useable;
				newDataTo.unique = fromData.unique;
				newDataTo.slot = parseInt($toSlot);

				$toInv.find('[data-slot=' + $toSlot + ']').data('item', newDataTo);

				$toInv.find('[data-slot=' + $toSlot + ']').addClass('item-drag');
				$toInv.find('[data-slot=' + $toSlot + ']').removeClass('item-nodrag');

				var ItemLabel =
					'<div class="item-slot-label"><p>' + newDataTo.label + '</p></div>';
				if (newDataTo.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(newDataTo.name)) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
						newDataTo.label +
							'</p></div>';
					}
				}

				if ($toSlot < 6 && $toInv.attr('data-inventory') == 'player') {
					var isValid = validURL(newDataTo.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="' +
									newDataTo.image +
									'" alt="' +
									newDataTo.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newDataTo.amount +
									'</p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									$toSlot +
									'</p></div><div class="item-slot-img"><img src="images/' +
									newDataTo.image +
									'" alt="' +
									newDataTo.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newDataTo.amount +
									'</p></div>' +
									ItemLabel
							);
					}
				} else {
					var isValid = validURL(newDataTo.image);
					if (isValid) {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="' +
									newDataTo.image +
									'" alt="' +
									newDataTo.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newDataTo.amount +
									'</p></div>' +
									ItemLabel
							);
					} else {
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="images/' +
									newDataTo.image +
									'" alt="' +
									newDataTo.name +
									'" /></div><div class="item-slot-amount"><p>' +
									newDataTo.amount +
									'</p></div>' +
									ItemLabel
							);
					}
				}

				if (newDataTo.name.split('_')[0] == 'weapon') {
					if (!Inventory.IsWeaponBlocked(newDataTo.name)) {
						if (newDataTo.info.quality == undefined) {
							newDataTo.info.quality = 100.0;
						}
						var QualityColor = 'rgb(39, 174, 96)';
						if (newDataTo.info.quality < 25) {
							QualityColor = 'rgb(192, 57, 43)';
						} else if (
							newDataTo.info.quality > 25 &&
							newDataTo.info.quality < 50
						) {
							QualityColor = 'rgb(230, 126, 34)';
						} else if (newDataTo.info.quality >= 50) {
							QualityColor = 'rgb(39, 174, 96)';
						}
						if (newDataTo.info.quality !== undefined) {
							qualityLabel = newDataTo.info.quality.toFixed();
						} else {
							qualityLabel = newDataTo.info.quality;
						}
						if (newDataTo.info.quality == 0) {
							qualityLabel = 'ROTO';
						}
						$toInv
							.find('[data-slot=' + $toSlot + ']')
							.find('.item-slot-quality-bar')
							.css({
								width: qualityLabel + '%',
								'background-color': QualityColor
							})
							.find('p')
							.html(qualityLabel);
					}
				}

				var newDataFrom = [];
				newDataFrom.name = fromData.name;
				newDataFrom.label = fromData.label;
				newDataFrom.amount = parseInt(fromData.amount - $toAmount);
				newDataFrom.type = fromData.type;
				newDataFrom.description = fromData.description;
				newDataFrom.image = fromData.image;
				newDataFrom.weight = fromData.weight;
				newDataFrom.price = fromData.price;
				newDataFrom.info = fromData.info;
				newDataFrom.useable = fromData.useable;
				newDataFrom.unique = fromData.unique;
				newDataFrom.slot = parseInt($fromSlot);

				$fromInv.find('[data-slot=' + $fromSlot + ']').data('item', newDataFrom);

				$fromInv.find('[data-slot=' + $fromSlot + ']').addClass('item-drag');
				$fromInv.find('[data-slot=' + $fromSlot + ']').removeClass('item-nodrag');

				if ($fromInv.attr('data-inventory').split('-')[0] == 'itemshop') {
					var isValid = validURL(newDataFrom.image);
					if (isValid) {
						$fromInv
							.find('[data-slot=' + $fromSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="' +
									newDataFrom.image +
									'" alt="' +
									newDataFrom.name +
									'" /></div><div class="item-slot-amount"><p>$' +
									newDataFrom.price +
									'</p></div><div class="item-slot-label"><p>' +
									newDataFrom.label +
									'</p></div>'
							);
					} else {
						$fromInv
							.find('[data-slot=' + $fromSlot + ']')
							.html(
								'<div class="item-slot-img"><img src="images/' +
									newDataFrom.image +
									'" alt="' +
									newDataFrom.name +
									'" /></div><div class="item-slot-amount"><p>$' +
									newDataFrom.price +
									'</p></div><div class="item-slot-label"><p>' +
									newDataFrom.label +
									'</p></div>'
							);
					}
				} else {
					var ItemLabel =
						'<div class="item-slot-label"><p>' +
						newDataFrom.label +
						'</p></div>';
					if (newDataFrom.name.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
							ItemLabel =
							'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
							newDataFrom.label +
								'</p></div>';
						}
					}

					if ($fromSlot < 6 && $fromInv.attr('data-inventory') == 'player') {
						var isValid = validURL(newDataFrom.image);
						if (isValid) {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										$fromSlot +
										'</p></div><div class="item-slot-img"><img src="' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										$fromSlot +
										'</p></div><div class="item-slot-img"><img src="images/' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						}
					} else {
						var isValid = validURL(newDataFrom.image);
						if (isValid) {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-img"><img src="' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.html(
									'<div class="item-slot-img"><img src="images/' +
										newDataFrom.image +
										'" alt="' +
										newDataFrom.name +
										'" /></div><div class="item-slot-amount"><p>' +
										newDataFrom.amount +
										'</p></div>' +
										ItemLabel
								);
						}
					}

					if (newDataFrom.name.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
							if (newDataFrom.info.quality == undefined) {
								newDataFrom.info.quality = 100.0;
							}
							var QualityColor = 'rgb(39, 174, 96)';
							if (newDataFrom.info.quality < 25) {
								QualityColor = 'rgb(192, 57, 43)';
							} else if (
								newDataFrom.info.quality > 25 &&
								newDataFrom.info.quality < 50
							) {
								QualityColor = 'rgb(230, 126, 34)';
							} else if (newDataFrom.info.quality >= 50) {
								QualityColor = 'rgb(39, 174, 96)';
							}
							if (newDataFrom.info.quality !== undefined) {
								qualityLabel = newDataFrom.info.quality.toFixed();
							} else {
								qualityLabel = newDataFrom.info.quality;
							}
							if (newDataFrom.info.quality == 0) {
								qualityLabel = 'ROTO';
							}
							$fromInv
								.find('[data-slot=' + $fromSlot + ']')
								.find('.item-slot-quality-bar')
								.css({
									width: qualityLabel + '%',
									'background-color': QualityColor
								})
								.find('p')
								.html(qualityLabel);
						}
					}
				}
				$.post('https://origen_inventory/PlayDropSound', JSON.stringify({}));
				$.post(
					'https://origen_inventory/SetInventoryData',
					JSON.stringify({
						fromInventory: $fromInv.attr('data-inventory'),
						toInventory: $toInv.attr('data-inventory'),
						fromSlot: $fromSlot,
						toSlot: $toSlot,
						fromAmount: fromData.amount,
						toAmount: $toAmount
					})
				);
			} else {
				InventoryError($fromInv, $fromSlot);
			}
		}
	} else {
		//InventoryError($fromInv, $fromSlot);
	}
	handleDragDrop();
}

function isItemAllowed(item, allowedItems) {
	var retval = false;
	$.each(allowedItems, function (index, i) {
		if (i == item) {
			retval = true;
		}
	});
	return retval;
}

function InventoryError($elinv, $elslot) {
	$elinv
		.find('[data-slot=' + $elslot + ']')
		.css('background', 'rgba(156, 20, 20, 0.5)')
		.css('transition', 'background 500ms');
	setTimeout(function () {
		$elinv.find('[data-slot=' + $elslot + ']').css('background', 'rgba(0, 0, 0)');
	}, 500);
	$.post('https://origen_inventory/PlayDropFail', JSON.stringify({}));
}

var requiredItemOpen = false;

(() => {
	Inventory = {};

	Inventory.droplabel = 'Otro inventario';
	Inventory.dropmaxweight = 100000;

	Inventory.Error = function () {
		$.post('https://origen_inventory/PlayDropFail', JSON.stringify({}));
	};

	Inventory.IsWeaponBlocked = function (WeaponName) {
		var DurabilityBlockedWeapons = [
			/*             "weapon_pistol_mk2",
                        "weapon_pistol",
                        "weapon_stungun",
                        "weapon_pumpshotgun",
                        "weapon_smg",
                        "weapon_carbinerifle",
                        "weapon_nightstick",
                        "weapon_flashlight", */
			'weapon_unarmed'
		];

		var retval = false;
		$.each(DurabilityBlockedWeapons, function (i, name) {
			if (name == WeaponName) {
				retval = true;
			}
		});
		return retval;
	};

	Inventory.QualityCheck = function (item, IsHotbar, IsOtherInventory) {
		if (!Inventory.IsWeaponBlocked(item.name)) {
			debuger('Inventory.QualityCheck',item, IsHotbar, IsOtherInventory, item?.name?.split('_')[0] == 'weapon',item?.decayRate )
			if (item?.name?.split('_')[0] == 'weapon' || item?.decayRate) {
				debuger('^2queality^0', item.info.quality)
				if (item.info.quality == undefined) {
					item.info.quality = 100;
				}
				var QualityColor = 'rgb(39, 174, 96)';
				if (item.info.quality < 25) {
					QualityColor = 'rgb(192, 57, 43)';
				} else if (item.info.quality > 25 && item.info.quality < 50) {
					QualityColor = 'rgb(230, 126, 34)';
				} else if (item.info.quality >= 50) {
					QualityColor = 'rgb(39, 174, 96)';
				}
				if (item.info.quality !== undefined) {
					qualityLabel = item.info.quality.toFixed();
				} else {
					qualityLabel = item.info.quality;
				}
				if (item.info.quality == 0) {
					qualityLabel = 'ROTO';
					if (!IsOtherInventory) {
						if (!IsHotbar) {
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.find('.item-slot-quality-bar')
								.css({
									width: '100%',
									'background-color': QualityColor
								})
								.find('p')
								.html(qualityLabel);
						} else {
							$('.z-hotbar-inventory')
								.find('[data-zhotbarslot=' + item.slot + ']')
								.find('.item-slot-quality-bar')
								.css({
									width: '100%',
									'background-color': QualityColor
								})
								.find('p')
								.html(qualityLabel);
						}
					} else {
						$('.other-inventory')
							.find('[data-slot=' + item.slot + ']')
							.find('.item-slot-quality-bar')
							.css({
								width: '100%',
								'background-color': QualityColor
							})
							.find('p')
							.html(qualityLabel);
					}
				} else {
					if (!IsOtherInventory) {
						if (!IsHotbar) {
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.find('.item-slot-quality-bar')
								.css({
									width: qualityLabel + '%',
									'background-color': QualityColor
								})
								.find('p')
								.html(qualityLabel);
						} else {
							$('.z-hotbar-inventory')
								.find('[data-zhotbarslot=' + item.slot + ']')
								.find('.item-slot-quality-bar')
								.css({
									width: qualityLabel + '%',
									'background-color': QualityColor
								})
								.find('p')
								.html(qualityLabel);
						}
					} else {
						$('.other-inventory')
							.find('[data-slot=' + item.slot + ']')
							.find('.item-slot-quality-bar')
							.css({
								width: qualityLabel + '%',
								'background-color': QualityColor
							})
							.find('p')
							.html(qualityLabel);
					}
				}
			}
		}
	};

	Inventory.Open = async function (data) {
		if (JSON.stringify(document.getElementById(atob('ZnJvbV9vcmlnZW4='))) === 'null')
			return;
		loadVehicleInfo();
		totalWeight = 0;
		totalWeightOther = 0;

		$('#uso-salud').css('width', data.health + '%');
		$('#uso-hambre').css('width', data.hunger + '%');
		$('#uso-sed').css('width', data.thirst + '%');
		$('#uso-armor').css('width', data.armor.toFixed(2) + '%');

		$('#nearPlayers').html('');
		$('#item-amount').val('0');
		$('.other-inventory').html('');
		$('.ply-hotbar-inventory').find('.item-slot').remove();
		$('.other-inventory, .player-inventory').html('');
		$('[tab="vehicle"]').css('display', data.inVehicle ? '' : 'none');

		if (requiredItemOpen) {
			$('.requiredItem-container').hide();
			requiredItemOpen = false;
		}

		if (data.job) {
			$('.tab-business').show();
			$('.business-name').text(data.job.label);
			playerBusiness = data.job.label.replace(/\W/g, '');

			$('.reparar').hide();
			$('.buy_veh').hide();
			$('.sell_veh').hide();

			switch (data.job.type) {
				case 'mechanic':
					$('.reparar').show();
					break;
				case 'compraventa':
					$('.buy_veh').show();
					$('.sell_veh').show();
					break;
				default:
					break;
			}
		} else {
			$('.tab-business').hide();
			if ($('.new-inventory .tab-content.negocio').hasClass('active')) {
				$('.new-inventory .inventory-tab.tab-business.selected').removeClass(
					'selected'
				);
				$('.new-inventory .inventory-tab.tab-inventory').addClass('selected');
				$('.new-inventory .tab-content.negocio.active')
					.removeClass('active')
					.fadeOut(0, function () {
						$(".new-inventory .tab-content[tab='inventory']")
							.addClass('active')
							.fadeIn(0);
					});
			}
		}

		// $("#qbus-inventory").removeClass("anim-salida-info").fadeIn(300);
		$('.new-inventory').addClass('show').fadeIn(500);
		open_sound.currentTime = '0';
		open_sound.play();
		if (data.other != null && data.other != '') {
			$('.other-inventory').attr('data-inventory', data.other.name);
			$('.new-inventory .inventory-tab.selected').removeClass('selected');
			$('.new-inventory .inventory-tab.tab-inventory').addClass('selected');
			$('.new-inventory .tab-content.active')
				.removeClass('active')
				.fadeOut(0, function () {
					$(".new-inventory .tab-content[tab='inventory']")
						.addClass('active')
						.fadeIn(0);
				});
		} else {
			$('.other-inventory').attr('data-inventory', 0);
		}
		// First 5 Slots
		for (i = 1; i < 6; i++) {
			$('.player-inventory').append(
				'<div class="item-slot flotante slot-flotante-' +
					i +
					'" data-slot="' +
					i +
					'"><div class="item-slot-key"><p>' +
					i +
					'</p></div><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>'
			);
		}
		// Inventory
		for (i = 6; i < data.slots + 1; i++) {
			$('.player-inventory').append(
				'<div class="item-slot" data-slot="' +
					i +
					'"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>'
			);
		}

		if (data.other != null && data.other != '') {
			$('.oth-inv-container, .other-inv-info').show();
			$('#item-use').hide();
			// $(".inv-container").css("top", "0");
			//$(".ply-iteminfo-container").css("top", "194px");
			$('.ply-iteminfo-container').removeClass('inv-normal');
			// $(".inv-container").css("top", "9vw");
			$('.second-inventory').show();
			$('.sin-inventario').hide();
			if (mini) {
				$('.inventory-block.mini').removeClass('mini');
			}
			// console.log(JSON.stringify(data))
			for (i = 1; i < data.other.slots + 1; i++) {
				// if(data.other.inventory[i - 1] != null)
				$('.other-inventory').append(
					'<div class="item-slot" data-slot="' +
						i +
						'"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>'
				);
			}
			if (data.other.name == 'origen_craft') {
				$('.other-inventory')
					.find('[data-slot=' + data.other.slots + ']')
					.css('opacity', '0.5');
			}
		} else {
			$('.second-inventory').hide();
			$('#item-use').show();
			$('.sin-inventario').show();
			if (mini && $('.tab-inventory').hasClass('selected')) {
				$('.inventory-block').addClass('mini');
			}
			// $(".inv-container").css("bottom", "30vh");
			//$(".ply-iteminfo-container").css("top", "291px");
			$('.ply-iteminfo-container').removeClass('inv-up').addClass('inv-normal');

			for (i = 1; i < data.slots + 1; i++) {
				$('.other-inventory').append(
					'<div class="item-slot" data-slot="' +
						i +
						'"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>'
				);
			}
			$('.other-inventory .item-slot').css({
				'background-color': 'rgba(0, 0, 0)'
			});
		}

		if (data.inventory !== null) {
			$.each(data.inventory, function (i, item) {
				if (item != null) {
					totalWeight += item.weight * item.amount;
					var ItemLabel =
						'<div class="item-slot-label"><p>' + item.label + '</p></div>';
						debuger(JSON.stringify(item))
					if (item?.name?.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(item.name)) {
							ItemLabel =
							'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
							item.label +
								'</p></div>';
						}
					}

					if (item.decayRate) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
								item.label +
							'</p></div>';
					}

					if (item.slot < 6) {
						$('.player-inventory')
							.find('[data-slot=' + item.slot + ']')
							.addClass('item-drag');
						var isValid = validURL(item.image);
						if (isValid) {
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										item.slot +
										'</p></div><div class="item-slot-img"><img src="' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>' +
										item.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-key"><p>' +
										item.slot +
										'</p></div><div class="item-slot-img"><img src="images/' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>' +
										item.amount +
										'</p></div>' +
										ItemLabel
								);
						}
						$('.player-inventory')
							.find('[data-slot=' + item.slot + ']')
							.data('item', item);
					} else {
						var isValid = validURL(item.image);
						if (isValid) {
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.addClass('item-drag');
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-img"><img src="' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>' +
										item.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.addClass('item-drag');
							$('.player-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-img"><img src="images/' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>' +
										item.amount +
										'</p></div>' +
										ItemLabel
								);
						}
						$('.player-inventory')
							.find('[data-slot=' + item.slot + ']')
							.data('item', item);
					}
					Inventory.QualityCheck(item, false, false);
				}
			});
		}

		if (data.other != null && data.other != '' && data.other.inventory != null) {
			$.each(data.other.inventory, function (i, item) {
				if (item != null) {
					totalWeightOther += item.weight * item.amount;
					var ItemLabel =
						'<div class="item-slot-label"><p>' + item.label + '</p></div>';
					if (item.name.split('_')[0] == 'weapon') {
						if (!Inventory.IsWeaponBlocked(item.name)) {
							ItemLabel =
							'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
							item.label +
								'</p></div>';
						}
					}

					if (item.decayRate) {
						ItemLabel =
						'<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' +
						item.label +
							'</p></div>';
					}
					$('.other-inventory')
						.find('[data-slot=' + item.slot + ']')
						.addClass('item-drag');
					if (item.price != null) {
						var isValid = validURL(item.image);
						if (isValid) {
							$('.other-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-img"><img src="' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>$' +
										item.price +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$('.other-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-img"><img src="images/' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>$' +
										item.price +
										'</p></div>' +
										ItemLabel
								);
						}
					} else {
						var isValid = validURL(item.image);
						if (isValid) {
							$('.other-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-img"><img src="' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>' +
										item.amount +
										'</p></div>' +
										ItemLabel
								);
						} else {
							$('.other-inventory')
								.find('[data-slot=' + item.slot + ']')
								.html(
									'<div class="item-slot-img"><img src="images/' +
										item.image +
										'" alt="' +
										item.name +
										'" /></div><div class="item-slot-amount"><p>' +
										item.amount +
										'</p></div>' +
										ItemLabel
								);
						}
					}
					$('.other-inventory')
						.find('[data-slot=' + item.slot + ']')
						.data('item', item);
					Inventory.QualityCheck(item, false, true);
				}
			});
		}

		//$("#usoEspacio").html("Espacio: " + (totalWeight / 1000).toFixed(2) + " / " + (data.maxweight / 1000).toFixed(2));
		let percent =
			((totalWeight / 1000).toFixed(2) / (data.maxweight / 1000).toFixed(2)) * 100;
		$('#enUsoPersonal').css('width', percent + '%');

		playerMaxWeight = data.maxweight;
		if (data.other != null) {
			var name = data.other.name.toString();
			if (
				name != null &&
				(name.split('-')[0] == 'itemshop' || name == 'crafting')
			) {
				$('#other-inv-label').html(data.other.label);
			} else {
				$('#other-inv-label').html(data.other.label);
				$('#other-inv-weight').html(
					'Espacio: ' +
						(totalWeightOther / 1000).toFixed(2) +
						' / ' +
						(data.other.maxweight / 1000).toFixed(2)
				);
			}
			otherMaxWeight = data.other.maxweight;
			otherLabel = data.other.label;
		} else {
			$('#other-inv-label').html(Inventory.droplabel);
			$('#other-inv-weight').html(
				'Espacio: ' +
					(totalWeightOther / 1000).toFixed(2) +
					' / ' +
					(Inventory.dropmaxweight / 1000).toFixed(2)
			);
			otherMaxWeight = Inventory.dropmaxweight;
			otherLabel = Inventory.droplabel;
		}

		$.each(data.maxammo, function (index, ammotype) {
			$('#' + index + '_ammo')
				.find('.ammo-box-amount')
				.css({ height: '0%' });
		});

		if (data.Ammo !== null) {
			$.each(data.Ammo, function (i, amount) {
				var Handler = i.split('_');
				var Type = Handler[1].toLowerCase();
				if (amount > data.maxammo[Type]) {
					amount = data.maxammo[Type];
				}
				var Percentage = (amount / data.maxammo[Type]) * 100;

				$('#' + Type + '_ammo')
					.find('.ammo-box-amount')
					.css({ height: Percentage + '%' });
				$('#' + Type + '_ammo')
					.find('span')
					.html(amount + 'x');
			});
		}

		handleDragDrop();
	};

	Inventory.Close = function () {
		// $(".item-slot").css("border", "1px solid rgba(255, 255, 255, 0.1)");
		$('.ply-hotbar-inventory').css('display', 'block');
		$('.ply-iteminfo-container').css('display', 'none');
		// $("#qbus-inventory").addClass("anim-salida-info").fadeOut(300, function() {
		//     $(".item-slot").remove();
		//     $(".item-money").remove();
		// });
		$('.ui-draggable-dragging').remove();
		$('.combine-option-container').hide();

		if ($('#rob-money').length) {
			$('#rob-money').remove();
		}
		$.post('https://origen_inventory/CloseInventory', JSON.stringify({}));

		if (AttachmentScreenActive) {
			$('#qbus-inventory').css({ left: '0vw' });
			$('.weapon-attachments-container').css({ left: '-100vw' });
			AttachmentScreenActive = false;
		}

		if (ClickedItemData !== null) {
			$('#weapon-attachments').fadeOut(250, function () {
				$('#weapon-attachments').remove();
				ClickedItemData = {};
			});
		}
		$('.new-inventory').removeClass('show');
		$('.ply-iteminfo-container').css('display', 'none');
	};

	Inventory.Update = function (data) {
		totalWeight = 0;
		totalWeightOther = 0;
		$('.player-inventory').find('.item-slot').remove();
		$('.ply-hotbar-inventory').find('.item-slot').remove();
		if (data.error) {
			Inventory.Error();
		}
		for (i = 1; i < data.slots + 1; i++) {
			$('.player-inventory').append(
				'<div class="item-slot" data-slot="' +
					i +
					'"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>'
			);
		}

		$.each(data.inventory, function (i, item) {
			if (item != null) {
				totalWeight += item.weight * item.amount;
				if (item.slot < 6) {
					$('.player-inventory')
						.find('[data-slot=' + item.slot + ']')
						.addClass('item-drag');
					var isValid = validURL(item.image);
					if (isValid) {
						$('.player-inventory')
							.find('[data-slot=' + item.slot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									item.slot +
									'</p></div><div class="item-slot-img"><img src="' +
									item.image +
									'" alt="' +
									item.name +
									'" /></div><div class="item-slot-amount"><p>' +
									item.amount +
									' (' +
									((item.weight * item.amount) / 1000).toFixed(1) +
									')</p></div><div class="item-slot-label"><p>' +
									item.label +
									'</p></div>'
							);
					} else {
						$('.player-inventory')
							.find('[data-slot=' + item.slot + ']')
							.html(
								'<div class="item-slot-key"><p>' +
									item.slot +
									'</p></div><div class="item-slot-img"><img src="images/' +
									item.image +
									'" alt="' +
									item.name +
									'" /></div><div class="item-slot-amount"><p>' +
									item.amount +
									' (' +
									((item.weight * item.amount) / 1000).toFixed(1) +
									')</p></div><div class="item-slot-label"><p>' +
									item.label +
									'</p></div>'
							);
					}
					$('.player-inventory')
						.find('[data-slot=' + item.slot + ']')
						.data('item', item);
				} else {
					$('.player-inventory')
						.find('[data-slot=' + item.slot + ']')
						.addClass('item-drag');
					var isValid = validURL(item.image);
					if (isValid) {
						$('.player-inventory')
							.find('[data-slot=' + item.slot + ']')
							.html(
								'<div class="item-slot-img"><img src="' +
									item.image +
									'" alt="' +
									item.name +
									'" /></div><div class="item-slot-amount"><p>' +
									item.amount +
									' (' +
									((item.weight * item.amount) / 1000).toFixed(1) +
									')</p></div><div class="item-slot-label"><p>' +
									item.label +
									'</p></div>'
							);
					} else {
						$('.player-inventory')
							.find('[data-slot=' + item.slot + ']')
							.html(
								'<div class="item-slot-img"><img src="images/' +
									item.image +
									'" alt="' +
									item.name +
									'" /></div><div class="item-slot-amount"><p>' +
									item.amount +
									' (' +
									((item.weight * item.amount) / 1000).toFixed(1) +
									')</p></div><div class="item-slot-label"><p>' +
									item.label +
									'</p></div>'
							);
					}
					$('.player-inventory')
						.find('[data-slot=' + item.slot + ']')
						.data('item', item);
				}
			}
		});

		$('#player-inv-weight').html(
			'Espacio: ' +
				(totalWeight / 1000).toFixed(2) +
				' / ' +
				(data.maxweight / 1000).toFixed(2)
		);

		handleDragDrop();
	};

	Inventory.ToggleHotbar = function (data) {
		
	};

	Inventory.UseItem = function (data) {
		$('.itembox-container').hide();
		$('.itembox-container').fadeIn(250);
		$('#itembox-action').html('<p>Used</p>');
		$('#itembox-label').html('<p>' + data.item.label + '</p>');
		var isValid = validURL(data.item.image);
		if (isValid) {
			$('#itembox-image').html(
				'<div class="item-slot-img"><img src="' +
					data.item.image +
					'" alt="' +
					data.item.name +
					'" /></div>'
			);
		} else {
			$('#itembox-image').html(
				'<div class="item-slot-img"><img src="images/' +
					data.item.image +
					'" alt="' +
					data.item.name +
					'" /></div>'
			);
		}
		setTimeout(function () {
			$('.itembox-container').fadeOut(250);
		}, 2000);
	};

	var itemBoxtimer = null;
	var requiredTimeout = null;

	Inventory.itemBox = function (data) {
		if (itemBoxtimer !== null) {
			clearTimeout(itemBoxtimer);
		}
		var type = 'Used';
		if (data.type == 'add') {
			type = 'Received';
		} else if (data.type == 'remove') {
			type = 'Removed';
		}

		var isValid = validURL(data?.item?.image) | false;
		var element =
			'<div id="itembox-action"><p>' +
			type +
			'</p></div><div id="itembox-label"><p>' +
			data.item.label +
			'</p></div><div class="item-slot-img"><img src="images/' +
			data.item.image +
			'" alt="' +
			data.item.name +
			'" /></div>';
		if (isValid) {
			element =
				'<div id="itembox-action"><p>' +
				type +
				'</p></div><div id="itembox-label"><p>' +
				data.item.label +
				'</p></div><div class="item-slot-img"><img src="' +
				data.item.image +
				'" alt="' +
				data.item.name +
				'" /></div>';
		}

		var $itembox = $('.itembox-container.template').clone();
		$itembox.removeClass('template');
		$itembox.html(element);
		$('.itemboxes-container').prepend($itembox);
		setTimeout(() => {
			$itembox.addClass('show');
		}, 100);
		setTimeout(function () {
			$.when($itembox.removeClass('show').fadeOut(300)).done(function () {
				$itembox.remove();
			});
		}, 3300);
	};

	Inventory.RequiredItem = function (data) {
		if (requiredTimeout !== null) {
			clearTimeout(requiredTimeout);
		}
		if (data.toggle) {
			if (!requiredItemOpen) {
				$('.requiredItem-container').html('');
				$.each(data.items, function (index, item) {
					var isValid = validURL(item.image);
					var element =
						'<div class="requiredItem-box"><div id="requiredItem-action">Requerido</div><div id="requiredItem-label"><p>' +
						item.label +
						'</p></div><div id="requiredItem-image"><div class="item-slot-img"><img src="images/' +
						item.image +
						'" alt="' +
						item.name +
						'" /></div></div></div>';
					if (isValid) {
						element =
							'<div class="requiredItem-box"><div id="requiredItem-action">Requerido</div><div id="requiredItem-label"><p>' +
							item.label +
							'</p></div><div id="requiredItem-image"><div class="item-slot-img"><img src="' +
							item.image +
							'" alt="' +
							item.name +
							'" /></div></div></div>';
					}
					$('.requiredItem-container').hide();
					$('.requiredItem-container').append(element);
					$('.requiredItem-container').fadeIn(100);
				});
				requiredItemOpen = true;
			}
		} else {
			$('.requiredItem-container').fadeOut(100);
			requiredTimeout = setTimeout(function () {
				$('.requiredItem-container').html('');
				requiredItemOpen = false;
			}, 100);
		}
	};

	/// progress bar 
	Progressbar = {};

    Progressbar.Progress = function(data) {
        clearTimeout(cancelledTimer);

        $("#progress-label").text(data.label);
		$("#progress-bar").css("width", 0);
        $(".progress-container").fadeIn('fast', function() {
            $("#progress-bar").stop().css({"width": 0, "background": "#0084ac6b"}).animate({
              width: '100%'
            }, {
              duration: parseInt(data.duration),
              complete: function() {
                $(".progress-container").fadeOut('fast', function() {
                    $('#progress-bar').removeClass('cancellable');
                    $.post('https://origen_inventory/FinishAction', JSON.stringify({
                        })
                    );
                })
              }
            });
        });
    };

    Progressbar.ProgressCancel = function() {
        $("#progress-label").text("CANCELLED");
        $("#progress-bar").stop().css( {"width": "100%", "background-color": "rgba(71, 0, 0, 0.8)"});
        $('#progress-bar').removeClass('cancellable');

        cancelledTimer = setTimeout(function () {
            $(".progress-container").fadeOut('fast', function() {
                $("#progress-bar").css("width", 0);
                $.post('https://origen_inventory/CancelAction', JSON.stringify({
                    })
                );
            });
        }, 1000);
    };

    Progressbar.CloseUI = function() {
        $('.main-container').fadeOut('fast');
    };

	window.onload = function (e) {
		window.addEventListener('message', function (event) {
			switch (event.data.action) {
				case 'progress':
                Progressbar.Progress(event.data);
                break;
            case 'cancel':
                Progressbar.ProgressCancel();
                break;
				case 'open':
					//if (checkTranslate()) 
					Inventory.Open(event.data);
					break;
				case 'close':
					Inventory.Close();
					break;
				case 'update':
					Inventory.Update(event.data);
					break;
				case 'itemBox':
					Inventory.itemBox(event.data);
					break;
				case 'requiredItem':
					Inventory.RequiredItem(event.data);
					break;
				case 'toggleHotbar':
					Inventory.ToggleHotbar(event.data);
					break;
				case 'updatestatus':
					if (event.data.health) {
						$('#uso-salud').css('width', event.data.health + '%');
					}
					if (event.data.hunger && event.data.thirst) {
						$('#uso-hambre').css('width', event.data.hunger.toFixed(2) + '%');
						$('#uso-sed').css('width', event.data.thirst.toFixed(2) + '%');
					}
					if (event.data.armor != null) {
						$('#uso-armor').css('width', event.data.armor.toFixed(2) + '%');
					}
					break;
				case 'nearPlayers':
					$('#nearPlayers').html('');

					$.each(event.data.players, function (index, player) {
						$('#nearPlayers').append(
							'<button class="nearbyPlayerButton" data-player="' +
								player.player +
								'">ID ' +
								player.player +
								'</button>'
						);
						if (index == event.data.players.length - 1) {
							$('#nearPlayers').append(
								'<button class="cerrar-players">Cancelar</button>'
							);
						}
					});

					$('.nearbyPlayerButton').click(function () {
						$('#nearPlayers').html('');
						player = $(this).data('player');
						Inventory.Close();
						$.post(
							'https://origen_inventory/GiveItem',
							JSON.stringify({
								plyXd: player,
								ItemInfoFullHd: event.data.item,
								NumberOfItem: event.data.count
							})
						);
					});
					$('.cerrar-players').click(function () {
						$('#nearPlayers').fadeOut(300, function () {
							$(this).html('').show();
						});
					});

				case 'RobMoney':
					// $(".inv-options-list").append('<div class="inv-option-item" id="rob-money"><p>NEEM GELD</p></div>');
					// $("#rob-money").data('TargetId', event.data.TargetId);
					break;
				case 'ocultarHotbar':
					$('.z-hotbar-inventory')
						.addClass('slide-down')
						.fadeOut(300, function () {
							$(this).removeClass('slide-down');
						});
					break;
				case 'SetCraftResult':
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.css('opacity', '1.0');
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.html(
							'<div class="item-slot-img"><img src="images/' +
								event.data.fromData.image +
								'" alt="' +
								event.data.fromData.name +
								'" /></div><div class="item-slot-amount"><p>' +
								event.data.fromData.amount +
								' (' +
								(
									(event.data.fromData.weight *
										event.data.fromData.amount) /
									1000
								).toFixed(1) +
								')</p></div><div class="item-slot-label"><p>' +
								event.data.fromData.label +
								'</p></div>'
						);
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.data('item', event.data.fromData);
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.addClass('item-drag');
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.removeClass('item-nodrag');
					handleDragDrop();
					break;
				case 'ClearCraftResult':
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.css('opacity', '0.5');
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.html(
							'<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>'
						);
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.removeData('item');
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.addClass('item-nodrag');
					$('.other-inventory')
						.find('[data-slot=' + event.data.lastslot + ']')
						.removeClass('item-drag');
					handleDragDrop();
					break;
				case 'UpdateCraftItems':
					$('.other-inventory')
						.find('[data-slot=' + event.data.slot + ']')
						.html(
							'<div class="item-slot-img"><img src="images/' +
								event.data.fromData.image +
								'" alt="' +
								event.data.fromData.name +
								'" /></div><div class="item-slot-amount"><p>' +
								event.data.fromData.amount +
								' (' +
								(
									(event.data.fromData.weight *
										event.data.fromData.amount) /
									1000
								).toFixed(1) +
								')</p></div><div class="item-slot-label"><p>' +
								event.data.fromData.label +
								'</p></div>'
						);
					$('.other-inventory')
						.find('[data-slot=' + event.data.slot + ']')
						.data('item', event.data.fromData);
					handleDragDrop();
					break;
				case 'ClearCraftItems':
					$('.other-inventory')
						.find('[data-slot=' + event.data.slot + ']')
						.html(
							'<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>'
						);
					$('.other-inventory')
						.find('[data-slot=' + event.data.slot + ']')
						.removeData('item');
					handleDragDrop();
					break;
				case 'sendTranslations':
					translations = event.data.translations;
					UpdateTranslations();
					break;
			}

			if (event.data.radio) {
				radioFunctions.radioNetEvents(event.data);
			}
		});
	};
})();
/// CONTINUED
function UpdateTranslations() {
	const transalateElements = $('[translate]');
	transalateElements.each(function () {
		const key = $(this).attr('translate');
		if (translations[key]) {
			$(this).html(translations[key]);
		}
	});
}

$(document).on('click', '#rob-money', function (e) {
	e.preventDefault();
	var TargetId = $(this).data('TargetId');
	$.post(
		'https://origen_inventory/RobMoney',
		JSON.stringify({
			TargetId: TargetId
		})
	);
	$('#rob-money').remove();
});

$(document).ready(function () {
	window.addEventListener('message', function (event) {
		switch (event.data.action) {
			case 'close':
				Inventory.Close();
				break;
		}
	});
	$('.tab-content.active').fadeIn(300);
	if (mini) {
		$('.inventory-block').addClass('mini');
	}
});

function validURL(str) {
	debuger(str)
	if ( str?.startsWith('https://') || str?.startsWith('http://')) {
		return true;
	} else {
		return false;
	}
}

//NUEVO
$(document).on('click', '.new-inventory .inventory-tab-list .inventory-tab', function () {
	if (!$(this).hasClass('selected')) {
		$('.new-inventory .inventory-tab.selected').removeClass('selected');
		$(this).addClass('selected');
		const yo = $(this);

		$('.new-inventory .tab-content.active')
			.removeClass('active')
			.fadeOut(150, function () {
				$(".new-inventory .tab-content[tab='" + yo.attr('tab') + "']")
					.addClass('active')
					.fadeIn(150);
			});

		if (mini) {
			if (yo.attr('tab') == 'inventory') {
				if ($('.second-inventory').css('display') == 'none') {
					$('.inventory-block').addClass('mini');
				}
			} else {
				$('.inventory-block.mini').removeClass('mini');
			}
		}
	}
});

// Evita el comportamiento default al presionar la tecla tab
$(document).on('keydown', function (e) {
	if (e.which === 9) {
		e.preventDefault();
	}
});

$(document).on('click', '.action-clothing', function (e) {
	let command = $(this).attr('command');
	$.post(
		'https://origen_inventory/ExecuteCommand',
		JSON.stringify({ command: command })
	);
});

$(document).on('click', '.command', function (e) {
	let command = $(this).attr('event');
	$.post(
		'https://origen_inventory/ExecuteCommand',
		JSON.stringify({ command: command })
	);
	Inventory.Close();
});

$(document).on('click', '.event', function (e) {
	let event = $(this).attr('event');
	$.post('https://origen_inventory/ExecuteEvent', JSON.stringify({ event }));
	Inventory.Close();
});

function fetch(event, data) {
	return $.post('https://origen_inventory/' + event, JSON.stringify(data)).promise();
}

function exportEvent(script, event, data) {
	return $.post('https://' + script + '/' + event, JSON.stringify(data)).promise();
}

function TriggerCallback(event, data) {
	data.name = event;
	return $.post(
		'https://origen_inventory/TriggerCallback',
		JSON.stringify(data)
	).promise();
}

function loadVehicleInfo() {
	exportEvent('origen_inventory', 'GetMenuData', {}).done((cb) => {
		if (cb === false) {
			$('.tab-vehicle').hide();
			if ($('.new-inventory .tab-content.vehicle').hasClass('active')) {
				$('.new-inventory .inventory-tab.tab-vehicle.selected').removeClass(
					'selected'
				);
				$('.new-inventory .inventory-tab.tab-inventory').addClass('selected');
				$('.new-inventory .tab-content.vehicle.active')
					.removeClass('active')
					.fadeOut(0, function () {
						$(".new-inventory .tab-content[tab='inventory']")
							.addClass('active')
							.fadeIn(0);
					});
			}
		} else {
			$('.vehicle .general, .vehicle .moto, .vehicle .coche').hide();
			$('.vehicle .limitador').hide();
			$('.vehicle .crucero').hide();
			$('.tab-vehicle').show();
			if (cb.ismoto || cb.isboat) {
				if (cb.ismoto) {
					$('.vehicle .general').show();
					$('.vehicle .moto').show();
				}
				if (cb.isboat) {
					$('.vehicle .general').show();
				}
			} else {
				$('.vehicle .general').show();
				$('.vehicle .coche').show();
				$('.vehicle .limitador').show();
				$('.vehicle .crucero').show();
			}
		}
	});
}

function ExecuteCommand(command) {
	$.post(
		'https://origen_inventory/executecommand',
		JSON.stringify({
			command: command
		})
	);

	if (command == 'trucos' || command == 'carradio') {
		Inventory.Close();
	}
}

function ExecuteDoor(door) {
	$.post(
		'https://origen_inventory/executecommand',
		JSON.stringify({
			command: 'puerta',
			args: door
		})
	);
}

function ExecuteWindow(element, window) {
	$.post(
		'https://origen_inventory/executecommand',
		JSON.stringify({
			command: 'ventana',
			args: window + ' ' + $(element).hasClass('active')
		})
	);
}

$(document).on('click', '.vehiculo .buttons .com-item', function () {
	if ($(this).attr('data-command')) {
		const command = $(this).attr('data-command');
		ExecuteCommand(command);
	} else if ($(this).attr('data-door')) {
		$.post(
			'https://origen_inventory/executecommand',
			JSON.stringify({
				command: 'puerta',
				args: $(this).attr('data-door')
			})
		);
	} else if ($(this).attr('data-window')) {
		$.post(
			'https://origen_inventory/executecommand',
			JSON.stringify({
				command: 'ventana',
				args: $(this).attr('data-window') + ' ' + $(this).hasClass('active')
			})
		);
	}
});

$(document).on('click', '.personal .action', function () {
	const action = $(this).attr('event');
	if (action == 'facturar') {
		exportEvent('origen_masterjob', 'newbill', {});
	} else if (action == 'reparar-vehiculo') {
		exportEvent('origen_masterjob', 'fixvehicle', {});
	} else if (action == 'buy-veh') {
		exportEvent('origen_masterjob', 'buy_vehicle', {});
	} else if (action == 'sell-veh') {
		exportEvent('origen_masterjob', 'sell_vehicle', {});
	} else if (action == 'facturar-tel') {
		exportEvent('origen_masterjob', 'newbill', { requestid: true });
	}
	Inventory.Close();
});

$(document).on('mouseenter', '.inventory-tab, .com-item, .action', function () {
	s_over.currentTime = '0';
	s_over.play();
});

$(document).on('click', '.inventory-tab, .com-item, .action', function () {
	click.currentTime = '0';
	click.play();
});

function stringToUrl(string) {
	return string
		.normalize('NFD')
		.replace(/[\u0300-\u036f]/g, '')
		.toLowerCase()
		.replace(/ /g, '-')
		.replace(/á/g, 'a')
		.replace(/é/g, 'e')
		.replace(/í/g, 'i')
		.replace(/ó/g, 'o')
		.replace(/ú/g, 'u')
		.replace(/ñ/g, 'n')
		.replace(/ü/g, 'u');
}

$(document).on('click', '.new-inventory-bg', function () {
	Inventory.Close();
});
