var InventoryOption = "255, 255 ,255 , 0.4 ";

var totalWeight = 0;
var totalWeightOther = 0;

var playerMaxWeight = 0;
var otherMaxWeight = 0;

var otherLabel = "";

var ClickedItemData = {};

var SelectedAttachment = null;
var AttachmentScreenActive = false;
var ControlPressed = false;
var disableRightMouse = false;
var selectedItem = null;

var IsDragging = false;

var a = 3;
var slotsxd = 0;

let animOut = false;
let timeOut;


$(document).on("dblclick", ".item-slot", function(e) {
    var ItemData = $(this).data("item");
    var ItemInventory = $(this).parent().attr("data-inventory");
    if (ItemData) {
        Inventory.Close();
        $.post("https://qb-inventory/UseItem", JSON.stringify({
            inventory: ItemInventory,
            item: ItemData,
        }));
    }
});
/* $(document).on("dblclick", ".item-slot", function(e) {
    var ItemData = $(this).data("item");
    var ItemInventory = $(this).parent().attr("data-inventory");
    if (ItemData) {
        // Muestra el recuadro personalizado al hacer doble clic en el elemento
        $("#custom-popup").show();
        
        // Asigna acciones a los botones del recuadro personalizado
        $("#agregarOpcion").on("click", function() {
            // Agregar lo que ya estaba
        Inventory.Close();
        $.post("https://qb-inventory/UseItem", JSON.stringify({
            inventory: ItemInventory,
            item: ItemData,
        }));
            // Cierra el recuadro personalizado si es necesario
            $("#custom-popup").hide();
        });

        $("#otraOpcion").on("click", function() {
            // Otra opción
            // Cierra el recuadro personalizado si es necesario
            $("#custom-popup").hide();
        });

        // Cierra el recuadro personalizado al hacer clic en la "X"
        $("#close-popup").on("click", function() {
            $("#custom-popup").hide();
        });
    }
}); */
$(document).on('keyup', function() {
    switch (event.keyCode) {
        case 112: // ESC
            Inventory.Close();
            ControlPressed = false;
        break;
        case 27: // ESC
           Inventory.Close();
           ControlPressed = false;
        break;
    }
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
$(document).on('mouseenter', '.item-slot', function (e) {
	e.preventDefault();

	if ($(this).data('item') != null) {
		// console.log($(this).offset().left);
		let top = $(this).offset().top + 'px';
		let left = $(this).offset().left - $(this).outerWidth() * 4 + 'px';
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


function GetFirstFreeSlot($toInv, $fromSlot) {
    var retval = null;
    $.each($toInv.find('.item-slot'), function(i, slot) {
        if ($(slot).data('item') === undefined) {
            if (retval === null) {
                retval = (i + 1);
            }
        }
    });
    return retval;
}



function CanQuickMove() {
    var otherinventory = otherLabel.toLowerCase();
    var retval = true;
    if (otherinventory.split("-")[0] == "player") {
        retval = false;
    }
    return retval;
}

$(document).on('click', '.item-slot', function() {
    if ($(".combine-option-container").css("display") == "block") {
        $(".combine-option-container").fadeOut(300);

    }
});

$(document).on("mousedown", ".item-slot", function(event) {
    switch (event.which) {
        case 3:
            fromSlot = $(this).attr("data-slot");
            fromInventory = $(this).parent();

            if ($(fromInventory).attr('data-inventory') == "player") {
                toInventory = $(".other-inventory");
            } else {
                toInventory = $(".player-inventory");
            }
            toSlot = GetFirstFreeSlot(toInventory, $(this));
            if ($(this).data('item') === undefined) {
                return;
            }
            toAmount = $(this).data("item").amount;
            if (toAmount > 1) {
                toAmount = 1;
            }

            if (CanQuickMove()) {

                if (toSlot === null) {
                    InventoryError(fromInventory, fromSlot);
                    return;
                }
                if (fromSlot == toSlot && fromInventory == toInventory) {

                    return;
                }

                if (toAmount >= 0) {
                    if (updateweights(fromSlot, toSlot, fromInventory, toInventory, toAmount)) {

                        swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
                    }
                }
            } else {
                InventoryError(fromInventory, fromSlot);
            }
            break;
    }
});


$(document).on("click", ".item-slot", function(e) {
    e.preventDefault();
    var ItemData = $(this).data("item");

    if (ItemData !== null && ItemData !== undefined) {
        if (ItemData.name !== undefined) {
            if (ItemData.name.split("_")[0] == "weapon") {
                if (!$("#weapon-attachments").length) {
                    $(".player-inv-info").append('<div class="inv-option-item" id="weapon-attachments"><p><i class="fa-solid fa-gun"></i>Accessories</p></div>');
                    $("#weapon-attachments").hide().fadeIn(300);
                    ClickedItemData = ItemData;
                } else if (ClickedItemData == ItemData) {
                    $("#weapon-attachments").fadeOut(250, function() {
                        $("#weapon-attachments").remove();
                    });
                    ClickedItemData = {};
                } else {
                    ClickedItemData = ItemData;
                }
            } else {
                ClickedItemData = {};
                if ($("#weapon-attachments").length) {
                    $("#weapon-attachments").fadeOut(250, function() {
                        $("#weapon-attachments").remove();
                    });
                }
            }
        } else {
            ClickedItemData = {};
            if ($("#weapon-attachments").length) {
                $("#weapon-attachments").fadeOut(250, function() {
                    $("#weapon-attachments").remove();
                });
            }
        }
    } else {
        ClickedItemData = {};
        if ($("#weapon-attachments").length) {
            $("#weapon-attachments").fadeOut(250, function() {
                $("#weapon-attachments").remove();
            });
        }
    }
});


/* $(document).on("click", ".item-slot", function(e) {
    e.preventDefault();
    var ItemData = $(this).data("item");

    if (ItemData !== null && ItemData !== undefined) {
        if (ItemData.name !== undefined) {
            if (ItemData.name === "marijuana_crop_low") {
                if (!$("#marijuana-info").length) {
                    $(".player-inv-info").append('<div class="inv-option-item" id="marijuana-info"><p><i class="fa-solid fa-cannabis"></i> Empaquetar</p></div>');
					
                    $("#marijuana-info").hide().fadeIn(300);
                    ClickedItemData = ItemData;
                } else if (ClickedItemData == ItemData) {
                    $("#marijuana-info").fadeOut(250, function() {
                        $("#marijuana-info").remove();
                    });
                    ClickedItemData = {};
                } else {
                    ClickedItemData = ItemData;
                }
            } else {
                ClickedItemData = {};
                if ($("#marijuana-info").length) {
                    $("#marijuana-info").fadeOut(250, function() {
                        $("#marijuana-info").remove();
                    });
                }
            }
        } else {
            ClickedItemData = {};
            if ($("#marijuana-info").length) {
                $("#marijuana-info").fadeOut(250, function() {
                    $("#marijuana-info").remove();
                });
            }
        }
    } else {
        ClickedItemData = {};
        if ($("#marijuana-info").length) {
            $("#marijuana-info").fadeOut(250, function() {
                $("#marijuana-info").remove();
            });
        }
    }
});
 */
/* $(document).on('click', '#marijuana-info', function(e) {
    e.preventDefault();
	$.post('https://qb-inventory/empaquetardroga', JSON.stringify())
    $("#qb-inventory1").css({ "display": "none" })

}); */

$(document).on('click', '.weapon-attachments-back', function(e) {
    e.preventDefault();
    $("#qb-inventory1").css({ "display": "block", "left": "13vw" });
    $(".weapon-attachments-container").css({"display": "none" });
	$(".weapon-attachments-container").addClass("slide-right");
	$(".weapon-attachments-container").fadeOut(300);
    AttachmentScreenActive = false;
});

function FormatAttachmentInfo(data) {
    $.post(
        "https://qb-inventory/GetWeaponData",
        JSON.stringify({
            weapon: data.name,
            ItemData: ClickedItemData,
        }),
        function (data) {
            var AmmoLabel = "9mm";
            var Durability = 100;
            if (data.WeaponData.ammotype == "AMMO_RIFLE") {
                AmmoLabel = "7.62";
            } else if (data.WeaponData.ammotype == "AMMO_SHOTGUN") {
                AmmoLabel = "12 Gauge";
            }
            if (ClickedItemData.info.quality !== undefined) {
                Durability = ClickedItemData.info.quality;
            }

            $(".weapon-attachments-container-title").html(data.WeaponData.label + " | " + AmmoLabel);
            $(".weapon-attachments-container-description").html(data.WeaponData.description);
            $(".weapon-attachments-container-details").html('<span style="font-weight: bold; letter-spacing: .1vh;">Serial Number</span><br> ' + ClickedItemData.info.serie + '<br><br><span style="font-weight: bold; letter-spacing: .1vh;">Durability - ' + Durability.toFixed() + '% </span> <div class="weapon-attachments-container-detail-durability"><div class="weapon-attachments-container-detail-durability-total"></div></div>');
            $(".weapon-attachments-container-detail-durability-total").css({
                width: Durability + "%",
            });
            $(".weapon-attachments-container-image").attr("src", "./attachment_images/" + data.WeaponData.name + ".png");
            $(".weapon-attachments").html("");

            if (data.AttachmentData !== null && data.AttachmentData !== undefined) {
                if (data.AttachmentData.length > 0) {
                    $(".weapon-attachments-title").html('<span style="font-weight: bold; letter-spacing: .1vh;">Attachments</span>');
                    $.each(data.AttachmentData, function (i, attachment) {
                        var WeaponType = data.WeaponData.ammotype.split("_")[1].toLowerCase();
                        $(".weapon-attachments").append('<div class="item-slot weapon-attachment" id="weapon-attachment-' + i + '"> <div class="item-slot-label"><p>' + attachment.label + '</p></div> <div class="item-slot-img"><img src="./images/' + attachment.attachment + '.png"></div> </div>');
                        attachment.id = i;
                        $("#weapon-attachment-" + i).data("AttachmentData", attachment);
                    });
                } else {
                    $(".weapon-attachments-title").html('<span style="font-weight: bold; letter-spacing: .1vh;">This gun doesn\'t contain attachments</span>');
                }
            } else {
                $(".weapon-attachments-title").html('<span style="font-weight: bold; letter-spacing: .1vh;">This gun doesn\'t contain attachments</span>');
            }

            handleAttachmentDrag();
        }
    );
}

var AttachmentDraggingData = {};

function handleAttachmentDrag() {
    $(".weapon-attachment").draggable({
        helper: 'clone',
        appendTo: "body",
        scroll: true,
        revertDuration: 500,
        revert: "invalid",
        start: function(event, ui) {
            var ItemData = $(this).data('AttachmentData');
            $(this).css("z-index", a++);
            $(this).addClass('weapon-dragging-class');
            AttachmentDraggingData = ItemData
        },
        stop: function() {
            $(this).removeClass('weapon-dragging-class');
        },
    });
    $(".weapon-attachments-remove").droppable({
        accept: ".weapon-attachment",
        hoverClass: 'weapon-attachments-remove-hover',
        drop: function(event, ui) {
            $.post('https://qb-inventory/RemoveAttachment', JSON.stringify({
                AttachmentData: AttachmentDraggingData,
                WeaponData: ClickedItemData,
            }), function(data) {
                if (data.Attachments !== null && data.Attachments !== undefined) {
                    if (data.Attachments.length > 0) {
                        $("#weapon-attachment-" + AttachmentDraggingData.id).fadeOut(150, function() {
                            $("#weapon-attachment-" + AttachmentDraggingData.id).remove();
                            AttachmentDraggingData = null;
                        });
                    } else {
                        $("#weapon-attachment-" + AttachmentDraggingData.id).fadeOut(150, function() {
                            $("#weapon-attachment-" + AttachmentDraggingData.id).remove();
                            AttachmentDraggingData = null;
                            $(".weapon-attachments").html("");
                        });
                        $(".weapon-attachments-title").html('<span style="font-weight: bold; letter-spacing: .1vh;">Este arma no contiene archivos adjuntos.</span>');
                    }
                } else {
                    $("#weapon-attachment-" + AttachmentDraggingData.id).fadeOut(150, function() {
                        $("#weapon-attachment-" + AttachmentDraggingData.id).remove();
                        AttachmentDraggingData = null;
                        $(".weapon-attachments").html("");
                    });
                    $(".weapon-attachments-title").html('<span style="font-weight: bold; letter-spacing: .1vh;">Este arma no contiene archivos adjuntos.</span>');
                }
            });
        },
    });
}

$(document).on('click', '#weapon-attachments', function(e) {
    e.preventDefault();

    if (!Inventory.IsWeaponBlocked(ClickedItemData.name)) {
        $(".weapon-attachments-container").css({ "display": "block" });
	$(".weapon-attachments-container").removeClass("slide-right");
	$(".weapon-attachments-container").addClass("slide-left");
        $(".info-arma").css("display", "block");
       $("#qb-inventory1").css({ "display": "none" })
        AttachmentScreenActive = true;
        FormatAttachmentInfo(ClickedItemData);
    } else {
        $.post('https://qb-inventory/Notify', JSON.stringify({
            message: "Los accesorios no están disponibles para este arma.",
            type: "error"
        }))
    }
});

function FormatItemInfo(itemData) {
    if (itemData != null && itemData.info != "") {
        if (itemData.name == "id_card") {
            var gender = "Man";
            if (itemData.info.gender == 1) {
                gender = "Woman";
            }
			
$('.item-info-title').html(`
    <div class="item-title-infos">
        <span class="gray-text-titule-item">${itemData.label}</span>
		
		<span class="gray-text-cantidad">X ${itemData.amount}</span>

        <span class="gray-textddd">(P${((itemData.weight * itemData.amount) / 1000).toFixed(1)})</span>

    </div>
`);

$('.item-info-description').html(`
    <div class="item-desc-infos-cards">

            <p><strong>CSN: </strong><span>${itemData.info.citizenid}</span></p>
            <p><strong>Firstname: </strong><span>${itemData.info.firstname}</span></p>
            <p><strong>Lastname: </strong><span>${itemData.info.lastname}</span></p>
            <p><strong>Birthdate: </strong><span>${itemData.info.birthdate}</span></p>
            <p><strong>Gender: </strong><span>${gender}</span></p>
            <p><strong>Nationality: </strong><span>${itemData.info.nationality}</span></p>

    </div>
`);

        } else if (itemData.name == "driver_license") {
$('.item-info-title').html(`
    <div class="item-title-infos">
        <span class="gray-text-titule-item">${itemData.label}</span>
		
		<span class="gray-text-cantidad">X ${itemData.amount}</span>

        <span class="gray-textddd">(P${((itemData.weight * itemData.amount) / 1000).toFixed(1)})</span>

    </div>
`);

$('.item-info-description').html(`
    <div class="item-desc-infos-cards">

            <p><strong>Firstname: </strong><span>${itemData.info.firstname}</span></p>
            <p><strong>Lastname: </strong><span>${itemData.info.lastname}</span></p>
            <p><strong>Birthdate: </strong><span>${itemData.info.birthdate}</span></p>
            <p><strong>License: </strong><span>${itemData.info.type}</span></p>

    </div>
`);

 
        } else if (itemData.name == "lawyerpass") {
 
            $(".item-info-title").html('<span class="green-text">' + itemData.info.model + '</span> <span class="gray-text">X ' + itemData.amount + ' (P' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</span>');
            $(".item-info-description").html('<p><strong>Pass-ID: </strong><span>' + itemData.info.id + '</span></p><p><strong>Firstname: </strong><span>' + itemData.info.firstname + '</span></p><p><strong>Lastname: </strong><span>' + itemData.info.lastname + '</span></p><p><strong>CSN: </strong><span>' + itemData.info.citizenid + '</span></p>');

        } else if (itemData.name == "harness") {

            $(".item-info-title").html('<span class="green-text">' + itemData.info.model + '</span> <span class="gray-text">X ' + itemData.amount + ' (P' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</span>');
            $(".item-info-description").html('<p>' + itemData.info.uses + ' uses left.</p>');

        } else if (itemData.name == "vehiclekey") {

			$(".item-info-title").html('<span class="green-text">' + itemData.info.model + '</span> <span class="gray-text">X ' + itemData.amount + ' (P' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</span>');
            $(".item-info-description").html('<p>Plate : ' + itemData.info.plate + '</p>');

		} else if (itemData.type == 'weapon') {
$('.item-info-title').html(`
    <div class="item-title-infos">
        <span class="gray-text-titule-item">${itemData.label}</span>
		
		<span class="gray-text-cantidad">X ${itemData.amount}</span>

        <span class="gray-textddd">(P${((itemData.weight * itemData.amount) / 1000).toFixed(1)})</span>

    </div>
`);
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
					                <p>
                <strong>Accesories: </strong>
                <span>${attachmentString}</span>
                </p>
                </div>`);
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
                    <div class="item-desc-infos">
        <div class="d-flex align-items-center justify-content-between">
            <p>${itemData.description}</p>
        </div>
    </div>`);
			}
        } else if (itemData.name == "filled_evidence_bag") {
$('.item-info-title').html(`
    <div class="item-title-infos">
        <span class="gray-text-titule-item">${itemData.label}</span>
		
		<span class="gray-text-cantidad">X ${itemData.amount}</span>

        <span class="gray-textddd">(P${((itemData.weight * itemData.amount) / 1000).toFixed(1)})</span>

    </div>
`);
            if (itemData.info.type == "casing") {
                $(".item-info-description").html('<p><strong>Evidence material: </strong><span>' + itemData.info.label + '</span></p><p><strong>Tipo de Numero: </strong><span>' + itemData.info.ammotype + '</span></p><p><strong>Calibre: </strong><span>' + itemData.info.ammolabel + '</span></p><p><strong>Serial number:</strong><span>' + itemData.info.serie + '</span></p><p><strong>Escena del Crimen: </strong><span>' + itemData.info.street + '</span></p><br /><p>' + itemData.description + '</p>');
            } else if (itemData.info.type == "blood") {
                $(".item-info-description").html('<p><strong>Evidence material: </strong><span>' + itemData.info.label + '</span></p><p><strong>Tipo de Sangre: </strong><span>' + itemData.info.bloodtype + '</span></p><p><strong>Codigo DNA: </strong><span>' + itemData.info.dnalabel + '</span></p><p><strong>Escena del Crimen: </strong><span>' + itemData.info.street + '</span></p><br /><p>' + itemData.description + '</p>');
            } else if (itemData.info.type == "fingerprint") {
                $(".item-info-description").html('<p><strong>Evidence material: </strong><span>' + itemData.info.label + '</span></p><p><strong>Vingerpatroon: </strong><span>' + itemData.info.fingerprint + '</span></p><p><strong>Plaats delict: </strong><span>' + itemData.info.street + '</span></p><br /><p>' + itemData.description + '</p>');
            } else if (itemData.info.type == "dna") {
                $(".item-info-description").html('<p><strong>Evidence material: </strong><span>' + itemData.info.label + '</span></p><p><strong>Codigo DNA: </strong><span>' + itemData.info.dnalabel + '</span></p><br /><p>' + itemData.description + '</p>');
            }
        } else if (itemData.info.costs != undefined && itemData.info.costs != null) {
$(".item-info-title").html('<span class="green-text">' + itemData.label + '</span> <span class="gray-text">X ' + itemData.amount + ' (P' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</span>');
            $(".item-info-description").html('<p>' + itemData.info.costs + '</p>');
        } else if (itemData.name == "stickynote") {
$(".item-info-title").html('<span class="green-text">' + itemData.label + '</span> <span class="gray-text">X ' + itemData.amount + ' (P' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</span>');
            $(".item-info-description").html('<p>' + itemData.info.label + '</p>');
        } else if (itemData.name == "moneybag") {
            $(".item-info-description").html(
                "<p><strong>Amount of cash: </strong><span>$" +
                itemData.info.cash +
                "</span></p>"
            );
        } else if (itemData.name == "markedbills") {
$('.item-info-title').html(`
    <div class="item-title-infos">
        <span class="gray-text-titule-item">${itemData.label}</span>
		
		<span class="gray-text-cantidad">X ${itemData.amount}</span>

        <span class="gray-textddd">(P${((itemData.weight * itemData.amount) / 1000).toFixed(1)})</span>

    </div>
`);
            $(".item-info-description").html(
                "<p><strong>Worth: </strong><span>$" +
                itemData.info.worth +
                "</span></p>"
            );
        } else if (itemData.name == "labkey") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>Lab: ' + itemData.info.lab + '</p>');
        } else {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p>' + itemData.description + '</p>')
        }
    } else {

$('.item-info-title').html(`
    <div class="item-title-infos">
        <span class="gray-text-titule-item">${itemData.label}</span>
		
		<span class="gray-text-cantidad">X ${itemData.amount}</span>

        <span class="gray-textddd">(P${((itemData.weight * itemData.amount) / 1000).toFixed(1)})</span>

    </div>
`);

$('.item-info-description').html(`
    <div class="item-desc-infos">
        <div class="d-flex align-items-center justify-content-between">
            <p>${itemData.description}</p>
        </div>
    </div>
`);
    }
}

function handleDragDrop() {
    var inUse = {
        use: false,
        give: false
    }
    $(".item-drag").draggable({
        helper: 'clone',
        appendTo: "body",
        scroll: false,
        revertDuration: 500,
        revert: "invalid",
        cancel: ".item-nodrag",
        start: function(event, ui) {
            IsDragging = true;
            $(this).find("img").css("filter", "brightness(50%)");
			$('.ply-iteminfo-container').fadeOut(100);

            var itemData = $(this).data("item");
            var dragAmount = $("#item-amount").val();
            if (!itemData.useable) {
                $("#item-use").css("background", "rgba(255,255,255, 0.7");
            }

            if (dragAmount == 0) {

                if (itemData.price != null) {
                    $(".ui-draggable-dragging").find(".item-slot-amount p").html('(' + itemData.amount + ') $' + itemData.price);
                    $(".ui-draggable-dragging").find(".item-slot-key").remove();
                    if ($(this).parent().attr("data-inventory") == "hotbar") {
                    }
                } else {

                    
                    $(".ui-draggable-dragging").find(".item-slot-key").remove();
                    if ($(this).parent().attr("data-inventory") == "hotbar") {

                    }
                }
            } else if (dragAmount > itemData.amount) {
                if (itemData.price != null) {
                    $(this).find(".item-slot-amount p").html('(' + itemData.amount + ') $' + itemData.price);
                    if ($(this).parent().attr("data-inventory") == "hotbar") {
                    }
                } else {

                    if ($(this).parent().attr("data-inventory") == "hotbar") {
                    }
                }
                InventoryError($(this).parent(), $(this).attr("data-slot"));
            } else if (dragAmount > 0) {
            } else {
                if ($(this).parent().attr("data-inventory") == "hotbar") {
                }

                $(".ui-draggable-dragging").find(".item-slot-key").remove();

                InventoryError($(this).parent(), $(this).attr("data-slot"));
            }
        },
        stop: function(event, ui) {

            setTimeout(function() {
                IsDragging = false;
            }, 300)
            
            $(this).find("img").css("filter", "brightness(100%)");
            $("#item-use").css("background", "rgba(" + InventoryOption + ")");
        },
    });

    $(".item-drag-money").draggable({
        helper: 'clone',
        appendTo: "body",
        scroll: false,
        revertDuration: 500,
        revert: "invalid",
        cancel: ".item-nodrag",
        start: function(event, ui) {
            IsDragging = true;
            $(this).find("img").css("filter", "brightness(50%)");

            $(".item-slot").css("border", "1px solid rgba(255, 255, 255, 0.1)")

            var itemData = $(this).data("item");
            var dragAmount = $("#item-amount").val();

        },
        stop: function(event, ui) {

            setTimeout(function() {
                IsDragging = false;
            }, 300)
            $(this).css("background", "rgba(0, 0, 0)");
            $(this).find("img").css("filter", "brightness(100%)");
            $("#item-use").css("background", "rgba(" + InventoryOption + ")");
        },
    });

    $(".item-slot").droppable({

        hoverClass: 'item-slot-hoverClass',
        drop: function(event, ui) {

            setTimeout(function() {
                IsDragging = false;
            }, 300)
            fromSlot = ui.draggable.attr("data-slot");
            fromInventory = ui.draggable.parent();
            toSlot = $(this).attr("data-slot");
            toInventory = $(this).parent();
            toAmount = $("#item-amount").val();

            if (fromSlot == toSlot && fromInventory == toInventory) {

                return;
            }

            if (fromSlot == slotsxd) {
                return;
            }
            if (toAmount >= 0) {
                if (updateweights(fromSlot, toSlot, fromInventory, toInventory, toAmount)) {
                    swap(fromSlot, toSlot, fromInventory, toInventory, toAmount);
                }
            }
        },
    });

    $("#item-use").droppable({
        hoverClass: 'button-hover',
        drop: function(event, ui) {
            console.log("use")
            inUse['use'] = true
            setTimeout(function() {
                IsDragging = false;
                inUse['use'] = false
            }, 300)
            fromData = ui.draggable.data("item");
            fromInventory = ui.draggable.parent().attr("data-inventory");
            if (fromData.useable) {
                if (fromData.shouldClose) {
                    Inventory.Close();
                }
                $.post("https://qb-inventory/UseItem", JSON.stringify({
                    inventory: fromInventory,
                    item: fromData,
                }));
            }
        }

    });



    $("#item-give").droppable({
        hoverClass: 'button-hover',
        drop: function(event, ui) {
            setTimeout(function() {
                IsDragging = false;
                inUse['drag'] = false
            }, 300)
            fromData = ui.draggable.data("item");
            fromInventory = ui.draggable.parent().attr("data-inventory");
            $.post("https://qb-inventory/GetNearPlayers", JSON.stringify({
                inventory: fromInventory,
                item: fromData,
                count: $("#item-amount").val()
            }));
        }
    });

    $("#item-drop").droppable({
        hoverClass: 'item-slot-hoverClass',
        drop: function(event, ui) {
            setTimeout(function() {
                IsDragging = false;
            }, 300)

            fromData = ui.draggable.data("item");
            fromInventory = ui.draggable.parent().attr("data-inventory");
            amount = $("#item-amount").val();
            if (amount == 0) { amount = fromData.amount }
            $(this).css("background", "rgba(35,35,35, 0.7");
            $.post("https://qb-inventory/DropItem", JSON.stringify({
                inventory: fromInventory,
                item: fromData,
                amount: parseInt(amount),
            }));
        }
    })
}

function updateweights($fromSlot, $toSlot, $fromInv, $toInv, $toAmount) {
    var otherinventory = otherLabel.toLowerCase();
    if (otherinventory.split("-")[0] == "dropped") {
        toData = $toInv.find("[data-slot=" + $toSlot + "]").data("item");
        if (toData !== null && toData !== undefined) {
            InventoryError($fromInv, $fromSlot);
            return false;
        }
    }

    if (($fromInv.attr("data-inventory") == "hotbar" && $toInv.attr("data-inventory") == "player") || ($fromInv.attr("data-inventory") == "player" && $toInv.attr("data-inventory") == "hotbar") || ($fromInv.attr("data-inventory") == "player" && $toInv.attr("data-inventory") == "player") || ($fromInv.attr("data-inventory") == "hotbar" && $toInv.attr("data-inventory") == "hotbar")) {
        return true;
    }

    if (($fromInv.attr("data-inventory").split("-")[0] == "itemshop" && $toInv.attr("data-inventory").split("-")[0] == "itemshop") || ($fromInv.attr("data-inventory") == "crafting" && $toInv.attr("data-inventory") == "crafting")) {
        itemData = $fromInv.find("[data-slot=" + $fromSlot + "]").data("item");
        if ($fromInv.attr("data-inventory").split("-")[0] == "itemshop") {
            $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + itemData.image + '" alt="' + itemData.name + '" /></div><div class="item-slot-amount"><p>(' + itemData.amount + ') $' + itemData.price + '</p></div><div class="item-slot-label"><p>' + itemData.label + '</p></div>');
        } else {
            $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + itemData.image + '" alt="' + itemData.name + '" /></div><div class="item-slot-amount"><p>' + itemData.amount + ' (' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + itemData.label + '</p></div>');

        }

        InventoryError($fromInv, $fromSlot);
        return false;
    }

    if ($toAmount == 0 && ($fromInv.attr("data-inventory").split("-")[0] == "itemshop" || $fromInv.attr("data-inventory") == "crafting")) {
        itemData = $fromInv.find("[data-slot=" + $fromSlot + "]").data("item");
        if ($fromInv.attr("data-inventory").split("-")[0] == "itemshop") {
            $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + itemData.image + '" alt="' + itemData.name + '" /></div><div class="item-slot-amount"><p>(' + itemData.amount + ') $' + itemData.price + '</p></div><div class="item-slot-label"><p>' + itemData.label + '</p></div>');
        } else {
            $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + itemData.image + '" alt="' + itemData.name + '" /></div><div class="item-slot-amount"><p>' + itemData.amount + ' (' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + itemData.label + '</p></div>');
        }

        InventoryError($fromInv, $fromSlot);
        return false;
    }

    if ($toInv.attr("data-inventory").split("-")[0] == "itemshop" || $toInv.attr("data-inventory") == "crafting") {
        itemData = $toInv.find("[data-slot=" + $toSlot + "]").data("item");
        if ($toInv.attr("data-inventory").split("-")[0] == "itemshop") {
            $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-img"><img src="images/' + itemData.image + '" alt="' + itemData.name + '" /></div><div class="item-slot-amount"><p>(' + itemData.amount + ') $' + itemData.price + '</p></div><div class="item-slot-label"><p>' + itemData.label + '</p></div>');
        } else {
            $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-img"><img src="images/' + itemData.image + '" alt="' + itemData.name + '" /></div><div class="item-slot-amount"><p>' + itemData.amount + ' (' + ((itemData.weight * itemData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + itemData.label + '</p></div>');
        }

        InventoryError($fromInv, $fromSlot);
        return false;
    }

    if ($fromInv.attr("data-inventory") != $toInv.attr("data-inventory")) {
        fromData = $fromInv.find("[data-slot=" + $fromSlot + "]").data("item");
        toData = $toInv.find("[data-slot=" + $toSlot + "]").data("item");
        if ($toAmount == 0) { $toAmount = fromData.amount }
        if (toData == null || fromData.name == toData.name) {
            if ($fromInv.attr("data-inventory") == "player" || $fromInv.attr("data-inventory") == "hotbar") {
                totalWeight = totalWeight - (fromData.weight * $toAmount);
                totalWeightOther = totalWeightOther + (fromData.weight * $toAmount);
            } else {
                totalWeight = totalWeight + (fromData.weight * $toAmount);
                totalWeightOther = totalWeightOther - (fromData.weight * $toAmount);
            }
        } else {
            if ($fromInv.attr("data-inventory") == "player" || $fromInv.attr("data-inventory") == "hotbar") {
                totalWeight = totalWeight - (fromData.weight * $toAmount);
                totalWeight = totalWeight + (toData.weight * toData.amount)

                totalWeightOther = totalWeightOther + (fromData.weight * $toAmount);
                totalWeightOther = totalWeightOther - (toData.weight * toData.amount);
            } else {
                totalWeight = totalWeight + (fromData.weight * $toAmount);
                totalWeight = totalWeight - (toData.weight * toData.amount)

                totalWeightOther = totalWeightOther - (fromData.weight * $toAmount);
                totalWeightOther = totalWeightOther + (toData.weight * toData.amount);
            }
        }
    }

    if (totalWeight > playerMaxWeight || (totalWeightOther > otherMaxWeight && $fromInv.attr("data-inventory").split("-")[0] != "itemshop" && $fromInv.attr("data-inventory") != "crafting")) {
        InventoryError($fromInv, $fromSlot);
        return false;
    }

    $("#player-inv-weight").html("Weight: " + (parseInt(totalWeight) / 1000).toFixed(2) + " / " + (playerMaxWeight / 1000).toFixed(2));
    if ($fromInv.attr("data-inventory").split("-")[0] != "itemshop" && $toInv.attr("data-inventory").split("-")[0] != "itemshop" && $fromInv.attr("data-inventory") != "crafting" && $toInv.attr("data-inventory") != "crafting") {
        $("#other-inv-label").html(otherLabel)
        $("#other-inv-weight").html("Weight: " + (parseInt(totalWeightOther) / 1000).toFixed(2) + " / " + (otherMaxWeight / 1000).toFixed(2))
        
    }

    return true;
}

var combineslotData = null;

$(document).on('click', '.CombineItem', function(e) {
    e.preventDefault();
    if (combineslotData.toData.combinable.anim != null) {
        $.post('https://qb-inventory/combineWithAnim', JSON.stringify({
            combineData: combineslotData.toData.combinable,
            usedItem: combineslotData.toData.name,
            requiredItem: combineslotData.fromData.name
        }))
    } else {
        $.post('https://qb-inventory/combineItem', JSON.stringify({
            reward: combineslotData.toData.combinable.reward,
            toItem: combineslotData.toData.name,
            fromItem: combineslotData.fromData.name
        }))
    }
    Inventory.Close();
});

$(document).on('click', '.SwitchItem', function(e) {
    e.preventDefault();
    $(".combine-option-container").hide();

    optionSwitch(combineslotData.fromSlot, combineslotData.toSlot, combineslotData.fromInv, combineslotData.toInv, combineslotData.toAmount, combineslotData.toData, combineslotData.fromData)
});

function optionSwitch($fromSlot, $toSlot, $fromInv, $toInv, $toAmount, toData, fromData) {
    fromData.slot = parseInt($toSlot);

    $toInv.find("[data-slot=" + $toSlot + "]").data("item", fromData);

    $toInv.find("[data-slot=" + $toSlot + "]").addClass("item-drag");
    $toInv.find("[data-slot=" + $toSlot + "]").removeClass("item-nodrag");


    if ($toSlot < 6) {
        $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>' + $toSlot + '</p></div><div class="item-slot-img"><img src="images/' + fromData.image + '" alt="' + fromData.name + '" /></div><div class="item-slot-amount"><p>' + fromData.amount + ' (' + ((fromData.weight * fromData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + fromData.label + '</p></div>');
    } else {
        $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-img"><img src="images/' + fromData.image + '" alt="' + fromData.name + '" /></div><div class="item-slot-amount"><p>' + fromData.amount + ' (' + ((fromData.weight * fromData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + fromData.label + '</p></div>');
    }

    toData.slot = parseInt($fromSlot);

    $fromInv.find("[data-slot=" + $fromSlot + "]").addClass("item-drag");
    $fromInv.find("[data-slot=" + $fromSlot + "]").removeClass("item-nodrag");

    $fromInv.find("[data-slot=" + $fromSlot + "]").data("item", toData);

    if ($fromSlot < 6) {
        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>' + $fromSlot + '</p></div><div class="item-slot-img"><img src="images/' + toData.image + '" alt="' + toData.name + '" /></div><div class="item-slot-amount"><p>' + toData.amount + ' (' + ((toData.weight * toData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + toData.label + '</p></div>');
    } else {
        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + toData.image + '" alt="' + toData.name + '" /></div><div class="item-slot-amount"><p>' + toData.amount + ' (' + ((toData.weight * toData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + toData.label + '</p></div>');
    }

    $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
        fromInventory: $fromInv.attr("data-inventory"),
        toInventory: $toInv.attr("data-inventory"),
        fromSlot: $fromSlot,
        toSlot: $toSlot,
        fromAmount: $toAmount,
        toAmount: toData.amount,
    }));
}

function swap($fromSlot, $toSlot, $fromInv, $toInv, $toAmount) {

    fromData = $fromInv.find("[data-slot=" + $fromSlot + "]").data("item");
    toData = $toInv.find("[data-slot=" + $toSlot + "]").data("item");
    var otherinventory = otherLabel.toLowerCase();

    if (otherinventory.split("-")[0] == "dropped") {
        if (toData !== null && toData !== undefined) {
            InventoryError($fromInv, $fromSlot);
            return;
        }
    }
    
    if (fromData !== undefined && fromData.amount >= $toAmount) {
        if (($fromInv.attr("data-inventory") == "player" || $fromInv.attr("data-inventory") == "hotbar") && $toInv.attr("data-inventory").split("-")[0] == "itemshop" && $toInv.attr("data-inventory") == "crafting") {
            InventoryError($toInv, $toSlot);
            return;
        }

        if ($toAmount == 0 && $fromInv.attr("data-inventory").split("-")[0] == "itemshop" && $fromInv.attr("data-inventory") == "crafting") {
            InventoryError($fromInv, $fromSlot);
            return;
        } else if ($toAmount == 0) {
            $toAmount = fromData.amount
        }
        if ((toData != undefined || toData != null) && toData.name == fromData.name && !fromData.unique) {
            var newData = [];
            newData.name = toData.name;
            newData.label = toData.label;
            newData.amount = (parseInt($toAmount) + parseInt(toData.amount));
            newData.type = toData.type;
            newData.description = toData.description;
            newData.image = toData.image;
            newData.weight = toData.weight;
            newData.info = toData.info;
            newData.useable = toData.useable;
            newData.unique = toData.unique;
            newData.slot = parseInt($toSlot);

            if (fromData.amount == $toAmount) {
                $toInv.find("[data-slot=" + $toSlot + "]").data("item", newData);

                $toInv.find("[data-slot=" + $toSlot + "]").addClass("item-drag");
                $toInv.find("[data-slot=" + $toSlot + "]").removeClass("item-nodrag");

                var ItemLabel = '<div class="item-slot-label"><p>' + newData.label + '</p></div>';
                if ((newData.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(newData.name)) {
                        ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + newData.label + '</p></div>';
                    }
                }

                if ($toSlot < 6 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>' + $toSlot + '</p></div><div class="item-slot-img"><img src="images/' + newData.image + '" alt="' + newData.name + '" /></div><div class="item-slot-amount"><p>' + newData.amount + ' (' + ((newData.weight * newData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else if ($toSlot == 41 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + newData.image + '" alt="' + newData.name + '" /></div><div class="item-slot-amount"><p>' + newData.amount + ' (' + ((newData.weight * newData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-img"><img src="images/' + newData.image + '" alt="' + newData.name + '" /></div><div class="item-slot-amount"><p>' + newData.amount + ' (' + ((newData.weight * newData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                }

                if ((newData.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(newData.name)) {
                        if (newData.info.quality == undefined) { newData.info.quality = 100.0; }
                        var QualityColor = "rgb(39, 174, 96)";
                        if (newData.info.quality < 25) {
                            QualityColor = "rgb(192, 57, 43)";
                        } else if (newData.info.quality > 25 && newData.info.quality < 50) {
                            QualityColor = "rgb(230, 126, 34)";
                        } else if (newData.info.quality >= 50) {
                            QualityColor = "rgb(39, 174, 96)";
                        }
                        if (newData.info.quality !== undefined) {
                            qualityLabel = (newData.info.quality).toFixed();
                        } else {
                            qualityLabel = (newData.info.quality);
                        }
                        if (newData.info.quality == 0) {
                            qualityLabel = "Estropeada";
                        }
                        $toInv.find("[data-slot=" + $toSlot + "]").find(".item-slot-quality-bar").css({
                            "width": qualityLabel + "%",
                            "background-color": QualityColor
                        }).find('p').html(qualityLabel);
                    }
                }

                $fromInv.find("[data-slot=" + $fromSlot + "]").removeClass("item-drag");
                $fromInv.find("[data-slot=" + $fromSlot + "]").addClass("item-nodrag");

                $fromInv.find("[data-slot=" + $fromSlot + "]").removeData("item");
                $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>');
            } else if (fromData.amount > $toAmount) {
                var newDataFrom = [];
                newDataFrom.name = fromData.name;
                newDataFrom.label = fromData.label;
                newDataFrom.amount = parseInt((fromData.amount - $toAmount));
                newDataFrom.type = fromData.type;
                newDataFrom.description = fromData.description;
                newDataFrom.image = fromData.image;
                newDataFrom.weight = fromData.weight;
                newDataFrom.price = fromData.price;
                newDataFrom.info = fromData.info;
                newDataFrom.useable = fromData.useable;
                newDataFrom.unique = fromData.unique;
                newDataFrom.slot = parseInt($fromSlot);

                $toInv.find("[data-slot=" + $toSlot + "]").data("item", newData);

                $toInv.find("[data-slot=" + $toSlot + "]").addClass("item-drag");
                $toInv.find("[data-slot=" + $toSlot + "]").removeClass("item-nodrag");

                var ItemLabel = '<div class="item-slot-label"><p>' + newData.label + '</p></div>';
                if ((newData.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(newData.name)) {
                        ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + newData.label + '</p></div>';
                    }
                }

                if ($toSlot < 6 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>' + $toSlot + '</p></div><div class="item-slot-img"><img src="images/' + newData.image + '" alt="' + newData.name + '" /></div><div class="item-slot-amount"><p>' + newData.amount + ' (' + ((newData.weight * newData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else if ($toSlot == 41 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + newData.image + '" alt="' + newData.name + '" /></div><div class="item-slot-amount"><p>' + newData.amount + ' (' + ((newData.weight * newData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-img"><img src="images/' + newData.image + '" alt="' + newData.name + '" /></div><div class="item-slot-amount"><p>' + newData.amount + ' (' + ((newData.weight * newData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                }

                if ((newData.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(newData.name)) {
                        if (newData.info.quality == undefined) { newData.info.quality = 100.0; }
                        var QualityColor = "rgb(39, 174, 96)";
                        if (newData.info.quality < 25) {
                            QualityColor = "rgb(192, 57, 43)";
                        } else if (newData.info.quality > 25 && newData.info.quality < 50) {
                            QualityColor = "rgb(230, 126, 34)";
                        } else if (newData.info.quality >= 50) {
                            QualityColor = "rgb(39, 174, 96)";
                        }
                        if (newData.info.quality !== undefined) {
                            qualityLabel = (newData.info.quality).toFixed();
                        } else {
                            qualityLabel = (newData.info.quality);
                        }
                        if (newData.info.quality == 0) {
                            qualityLabel = "ROTO";
                        }
                        $toInv.find("[data-slot=" + $toSlot + "]").find(".item-slot-quality-bar").css({
                            "width": qualityLabel + "%",
                            "background-color": QualityColor
                        }).find('p').html(qualityLabel);
                    }
                }

                $fromInv.find("[data-slot=" + $fromSlot + "]").data("item", newDataFrom);

                $fromInv.find("[data-slot=" + $fromSlot + "]").addClass("item-drag");
                $fromInv.find("[data-slot=" + $fromSlot + "]").removeClass("item-nodrag");

                if ($fromInv.attr("data-inventory").split("-")[0] == "itemshop") {
                    $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>(' + newDataFrom.amount + ') $' + newDataFrom.price + '</p></div><div class="item-slot-label"><p>' + newDataFrom.label + '</p></div>');
                } else {
                    var ItemLabel = '<div class="item-slot-label"><p>' + newDataFrom.label + '</p></div>';
                    if ((newDataFrom.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
                            ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + newDataFrom.label + '</p></div>';
                        }
                    }

                    if ($fromSlot < 6 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>' + $fromSlot + '</p></div><div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>' + newDataFrom.amount + ' (' + ((newDataFrom.weight * newDataFrom.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    } else if ($fromSlot == 41 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>' + newDataFrom.amount + ' (' + ((newDataFrom.weight * newDataFrom.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    } else {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>' + newDataFrom.amount + ' (' + ((newDataFrom.weight * newDataFrom.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    }

                    if ((newDataFrom.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
                            if (newDataFrom.info.quality == undefined) { newDataFrom.info.quality = 100.0; }
                            var QualityColor = "rgb(39, 174, 96)";
                            if (newDataFrom.info.quality < 25) {
                                QualityColor = "rgb(192, 57, 43)";
                            } else if (newDataFrom.info.quality > 25 && newDataFrom.info.quality < 50) {
                                QualityColor = "rgb(230, 126, 34)";
                            } else if (newDataFrom.info.quality >= 50) {
                                QualityColor = "rgb(39, 174, 96)";
                            }
                            if (newDataFrom.info.quality !== undefined) {
                                qualityLabel = (newDataFrom.info.quality).toFixed();
                            } else {
                                qualityLabel = (newDataFrom.info.quality);
                            }
                            if (newDataFrom.info.quality == 0) {
                                qualityLabel = "ROTO";
                            }
                            $fromInv.find("[data-slot=" + $fromSlot + "]").find(".item-slot-quality-bar").css({
                                "width": qualityLabel + "%",
                                "background-color": QualityColor
                            }).find('p').html(qualityLabel);
                        }
                    }
                }
            }
            $.post("https://qb-inventory/PlayDropSound", JSON.stringify({}));
            $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
                fromInventory: $fromInv.attr("data-inventory"),
                toInventory: $toInv.attr("data-inventory"),
                fromSlot: $fromSlot,
                toSlot: $toSlot,
                fromAmount: $toAmount,
            }));
        } else {
            if (fromData.amount == $toAmount) {
                if (toData != undefined && toData.combinable != null && isItemAllowed(fromData.name, toData.combinable.accept)) {
                    $.post('https://qb-inventory/getCombineItem', JSON.stringify({ item: toData.combinable.reward }), function(item) {
                        $('.combine-option-text').html("<p>Si combinas estos elementos, obtienes: <b>" + item.label + "</b></p>");
                    })
                    if ($("#weapon-attachments").css("display") == "block") {
                        $("#weapon-attachments").fadeOut(300, function() {
                            $(".combine-option-container").fadeIn(300);

                        })
                    } else {
                        $(".combine-option-container").fadeIn(300);

                    }
                    combineslotData = []
                    combineslotData.fromData = fromData
                    combineslotData.toData = toData
                    combineslotData.fromSlot = $fromSlot
                    combineslotData.toSlot = $toSlot
                    combineslotData.fromInv = $fromInv
                    combineslotData.toInv = $toInv
                    combineslotData.toAmount = $toAmount
                    return
                }

                fromData.slot = parseInt($toSlot);

                $toInv.find("[data-slot=" + $toSlot + "]").data("item", fromData);

                $toInv.find("[data-slot=" + $toSlot + "]").addClass("item-drag");
                $toInv.find("[data-slot=" + $toSlot + "]").removeClass("item-nodrag");

                var ItemLabel = '<div class="item-slot-label"><p>' + fromData.label + '</p></div>';
                if ((fromData.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(fromData.name)) {
                        ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + fromData.label + '</p></div>';
                    }
                }

                if ($toSlot < 6 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>' + $toSlot + '</p></div><div class="item-slot-img"><img src="images/' + fromData.image + '" alt="' + fromData.name + '" /></div><div class="item-slot-amount"><p>' + fromData.amount + ' (' + ((fromData.weight * fromData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else if ($toSlot == 41 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + fromData.image + '" alt="' + fromData.name + '" /></div><div class="item-slot-amount"><p>' + fromData.amount + ' (' + ((fromData.weight * fromData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-img"><img src="images/' + fromData.image + '" alt="' + fromData.name + '" /></div><div class="item-slot-amount"><p>' + fromData.amount + ' (' + ((fromData.weight * fromData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                }

                if ((fromData.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(fromData.name)) {
                        if (fromData.info.quality == undefined) { fromData.info.quality = 100.0; }
                        var QualityColor = "rgb(39, 174, 96)";
                        if (fromData.info.quality < 25) {
                            QualityColor = "rgb(192, 57, 43)";
                        } else if (fromData.info.quality > 25 && fromData.info.quality < 50) {
                            QualityColor = "rgb(230, 126, 34)";
                        } else if (fromData.info.quality >= 50) {
                            QualityColor = "rgb(39, 174, 96)";
                        }
                        if (fromData.info.quality !== undefined) {
                            qualityLabel = (fromData.info.quality).toFixed();
                        } else {
                            qualityLabel = (fromData.info.quality);
                        }
                        if (fromData.info.quality == 0) {
                            qualityLabel = "ROTO";
                        }
                        $toInv.find("[data-slot=" + $toSlot + "]").find(".item-slot-quality-bar").css({
                            "width": qualityLabel + "%",
                            "background-color": QualityColor
                        }).find('p').html(qualityLabel);
                    }
                }

                if (toData != undefined) {
                    toData.slot = parseInt($fromSlot);

                    $fromInv.find("[data-slot=" + $fromSlot + "]").addClass("item-drag");
                    $fromInv.find("[data-slot=" + $fromSlot + "]").removeClass("item-nodrag");

                    $fromInv.find("[data-slot=" + $fromSlot + "]").data("item", toData);

                    var ItemLabel = '<div class="item-slot-label"><p>' + toData.label + '</p></div>';
                    if ((toData.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(toData.name)) {
                            ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + toData.label + '</p></div>';
                        }
                    }

                    if ($fromSlot < 6 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>' + $fromSlot + '</p></div><div class="item-slot-img"><img src="images/' + toData.image + '" alt="' + toData.name + '" /></div><div class="item-slot-amount"><p>' + toData.amount + ' (' + ((toData.weight * toData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    } else if ($fromSlot == 41 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + toData.image + '" alt="' + toData.name + '" /></div><div class="item-slot-amount"><p>' + toData.amount + ' (' + ((toData.weight * toData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    } else {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + toData.image + '" alt="' + toData.name + '" /></div><div class="item-slot-amount"><p>' + toData.amount + ' (' + ((toData.weight * toData.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    }

                    if ((toData.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(toData.name)) {
                            if (toData.info.quality == undefined) { toData.info.quality = 100.0; }
                            var QualityColor = "rgb(39, 174, 96)";
                            if (toData.info.quality < 25) {
                                QualityColor = "rgb(192, 57, 43)";
                            } else if (toData.info.quality > 25 && toData.info.quality < 50) {
                                QualityColor = "rgb(230, 126, 34)";
                            } else if (toData.info.quality >= 50) {
                                QualityColor = "rgb(39, 174, 96)";
                            }
                            if (toData.info.quality !== undefined) {
                                qualityLabel = (toData.info.quality).toFixed();
                            } else {
                                qualityLabel = (toData.info.quality);
                            }
                            if (toData.info.quality == 0) {
                                qualityLabel = "ROTO";
                            }
                            $fromInv.find("[data-slot=" + $fromSlot + "]").find(".item-slot-quality-bar").css({
                                "width": qualityLabel + "%",
                                "background-color": QualityColor
                            }).find('p').html(qualityLabel);
                        }
                    }

                    $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
                        fromInventory: $fromInv.attr("data-inventory"),
                        toInventory: $toInv.attr("data-inventory"),
                        fromSlot: $fromSlot,
                        toSlot: $toSlot,
                        fromAmount: $toAmount,
                        toAmount: toData.amount,
                    }));
                } else {
                    $fromInv.find("[data-slot=" + $fromSlot + "]").removeClass("item-drag");
                    $fromInv.find("[data-slot=" + $fromSlot + "]").addClass("item-nodrag");

                    $fromInv.find("[data-slot=" + $fromSlot + "]").removeData("item");

                    if ($fromSlot < 6 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>' + $fromSlot + '</p></div><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>');
                    } else if ($fromSlot == 41 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>');
                    } else {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>');
                    }

                    $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
                        fromInventory: $fromInv.attr("data-inventory"),
                        toInventory: $toInv.attr("data-inventory"),
                        fromSlot: $fromSlot,
                        toSlot: $toSlot,
                        fromAmount: $toAmount,
                    }));
                }
                $.post("https://qb-inventory/PlayDropSound", JSON.stringify({}));
            } else if (fromData.amount > $toAmount && (toData == undefined || toData == null)) {

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

                $toInv.find("[data-slot=" + $toSlot + "]").data("item", newDataTo);

                $toInv.find("[data-slot=" + $toSlot + "]").addClass("item-drag");
                $toInv.find("[data-slot=" + $toSlot + "]").removeClass("item-nodrag");

                var ItemLabel = '<div class="item-slot-label"><p>' + newDataTo.label + '</p></div>';
                if ((newDataTo.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(newDataTo.name)) {
                        ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + newDataTo.label + '</p></div>';
                    }
                }

                if ($toSlot < 6 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>' + $toSlot + '</p></div><div class="item-slot-img"><img src="images/' + newDataTo.image + '" alt="' + newDataTo.name + '" /></div><div class="item-slot-amount"><p>' + newDataTo.amount + ' (' + ((newDataTo.weight * newDataTo.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else if ($toSlot == 41 && $toInv.attr("data-inventory") == "player") {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + newDataTo.image + '" alt="' + newDataTo.name + '" /></div><div class="item-slot-amount"><p>' + newDataTo.amount + ' (' + ((newDataTo.weight * newDataTo.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                } else {
                    $toInv.find("[data-slot=" + $toSlot + "]").html('<div class="item-slot-img"><img src="images/' + newDataTo.image + '" alt="' + newDataTo.name + '" /></div><div class="item-slot-amount"><p>' + newDataTo.amount + ' (' + ((newDataTo.weight * newDataTo.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                }

                if ((newDataTo.name).split("_")[0] == "weapon") {
                    if (!Inventory.IsWeaponBlocked(newDataTo.name)) {
                        if (newDataTo.info.quality == undefined) {
                            newDataTo.info.quality = 100.0;
                        }
                        var QualityColor = "rgb(39, 174, 96)";
                        if (newDataTo.info.quality < 25) {
                            QualityColor = "rgb(192, 57, 43)";
                        } else if (newDataTo.info.quality > 25 && newDataTo.info.quality < 50) {
                            QualityColor = "rgb(230, 126, 34)";
                        } else if (newDataTo.info.quality >= 50) {
                            QualityColor = "rgb(39, 174, 96)";
                        }
                        if (newDataTo.info.quality !== undefined) {
                            qualityLabel = (newDataTo.info.quality).toFixed();
                        } else {
                            qualityLabel = (newDataTo.info.quality);
                        }
                        if (newDataTo.info.quality == 0) {
                            qualityLabel = "ROTO";
                        }
                        $toInv.find("[data-slot=" + $toSlot + "]").find(".item-slot-quality-bar").css({
                            "width": qualityLabel + "%",
                            "background-color": QualityColor
                        }).find('p').html(qualityLabel);
                    }
                }

                var newDataFrom = [];
                newDataFrom.name = fromData.name;
                newDataFrom.label = fromData.label;
                newDataFrom.amount = parseInt((fromData.amount - $toAmount));
                newDataFrom.type = fromData.type;
                newDataFrom.description = fromData.description;
                newDataFrom.image = fromData.image;
                newDataFrom.weight = fromData.weight;
                newDataFrom.price = fromData.price;
                newDataFrom.info = fromData.info;
                newDataFrom.useable = fromData.useable;
                newDataFrom.unique = fromData.unique;
                newDataFrom.slot = parseInt($fromSlot);

                $fromInv.find("[data-slot=" + $fromSlot + "]").data("item", newDataFrom);

                $fromInv.find("[data-slot=" + $fromSlot + "]").addClass("item-drag");
                $fromInv.find("[data-slot=" + $fromSlot + "]").removeClass("item-nodrag");

                if ($fromInv.attr("data-inventory").split("-")[0] == "itemshop") {
                    $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>(' + newDataFrom.amount + ') $' + newDataFrom.price + '</p></div><div class="item-slot-label"><p>' + newDataFrom.label + '</p></div>');
                } else {

                    var ItemLabel = '<div class="item-slot-label"><p>' + newDataFrom.label + '</p></div>';
                    if ((newDataFrom.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
                            ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + newDataFrom.label + '</p></div>';
                        }
                    }

                    if ($fromSlot < 6 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>' + $fromSlot + '</p></div><div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>' + newDataFrom.amount + ' (' + ((newDataFrom.weight * newDataFrom.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    } else if ($fromSlot == 41 && $fromInv.attr("data-inventory") == "player") {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>' + newDataFrom.amount + ' (' + ((newDataFrom.weight * newDataFrom.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    } else {
                        $fromInv.find("[data-slot=" + $fromSlot + "]").html('<div class="item-slot-img"><img src="images/' + newDataFrom.image + '" alt="' + newDataFrom.name + '" /></div><div class="item-slot-amount"><p>' + newDataFrom.amount + ' (' + ((newDataFrom.weight * newDataFrom.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    }

                    if ((newDataFrom.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(newDataFrom.name)) {
                            if (newDataFrom.info.quality == undefined) { newDataFrom.info.quality = 100.0; }
                            var QualityColor = "rgb(39, 174, 96)";
                            if (newDataFrom.info.quality < 25) {
                                QualityColor = "rgb(192, 57, 43)";
                            } else if (newDataFrom.info.quality > 25 && newDataFrom.info.quality < 50) {
                                QualityColor = "rgb(230, 126, 34)";
                            } else if (newDataFrom.info.quality >= 50) {
                                QualityColor = "rgb(39, 174, 96)";
                            }
                            if (newDataFrom.info.quality !== undefined) {
                                qualityLabel = (newDataFrom.info.quality).toFixed();
                            } else {
                                qualityLabel = (newDataFrom.info.quality);
                            }
                            if (newDataFrom.info.quality == 0) {
                                qualityLabel = "ROTO";
                            }
                            $fromInv.find("[data-slot=" + $fromSlot + "]").find(".item-slot-quality-bar").css({
                                "width": qualityLabel + "%",
                                "background-color": QualityColor
                            }).find('p').html(qualityLabel);
                        }
                    }
                }
                $.post("https://qb-inventory/PlayDropSound", JSON.stringify({}));
                $.post("https://qb-inventory/SetInventoryData", JSON.stringify({
                    fromInventory: $fromInv.attr("data-inventory"),
                    toInventory: $toInv.attr("data-inventory"),
                    fromSlot: $fromSlot,
                    toSlot: $toSlot,
                    fromAmount: $toAmount,
                }));
            } else {
                InventoryError($fromInv, $fromSlot);
            }
        }
    } else {
    }
    handleDragDrop();
}

function isItemAllowed(item, allowedItems) {
    var retval = false
    $.each(allowedItems, function(index, i) {
        if (i == item) {
            retval = true;
        }
    });
    return retval
}

function InventoryError($elinv, $elslot) {

    $elinv.find("[data-slot=" + $elslot + "]").css("background", "rgba(156, 20, 20, 0.5)").css("transition", "background 500ms");
    setTimeout(function() {
        $elinv.find("[data-slot=" + $elslot + "]").css("background", "rgba(0, 0, 0)");
    }, 500)
    $.post("https://qb-inventory/PlayDropFail", JSON.stringify({}));
}

var requiredItemOpen = false;

(() => {
    Inventory = {};

    Inventory.slots = 40;

    Inventory.dropslots = 30;
    Inventory.droplabel = "Otro inventario";
    Inventory.dropmaxweight = 100000

    Inventory.Error = function() {
        $.post("https://qb-inventory/PlayDropFail", JSON.stringify({}));
    }

    Inventory.IsWeaponBlocked = function(WeaponName) {
        var DurabilityBlockedWeapons = [
            "weapon_unarmed"
        ]

        var retval = false;
        $.each(DurabilityBlockedWeapons, function(i, name) {
            if (name == WeaponName) {
                retval = true;
            }
        });
        return retval;
    }

    Inventory.QualityCheck = function(item, IsHotbar, IsOtherInventory) {
        if (!Inventory.IsWeaponBlocked(item.name)) {
            if ((item.name).split("_")[0] == "weapon") {
                if (item.info.quality == undefined) { item.info.quality = 100; }
                var QualityColor = "rgb(227, 227, 173)";
                if (item.info.quality < 25) {
                    QualityColor = "rgb(192, 57, 43)";
                } else if (item.info.quality > 25 && item.info.quality < 50) {
                    QualityColor = "rgb(230, 126, 34)";
                } else if (item.info.quality >= 50) {
                    QualityColor = "rgb(39, 174, 96)";
                }
                if (item.info.quality !== undefined) {
                    qualityLabel = (item.info.quality).toFixed();
                } else {
                    qualityLabel = (item.info.quality);
                }
                if (item.info.quality == 0) {
                    qualityLabel = "ROTO";
                    if (!IsOtherInventory) {
                        if (!IsHotbar) {
                            $(".player-inventory").find("[data-slot=" + item.slot + "]").find(".item-slot-quality-bar").css({
                                "width": "100%",
                                "background-color": QualityColor
                            }).find('p').html(qualityLabel);
                        } else {
                            $(".z-hotbar-inventory").find("[data-zhotbarslot=" + item.slot + "]").find(".item-slot-quality-bar").css({
                                "width": "100%",
                                "background-color": QualityColor
                            }).find('p').html(qualityLabel);
                        }
                    } else {
                        $(".other-inventory").find("[data-slot=" + item.slot + "]").find(".item-slot-quality-bar").css({
                            "width": "100%",
                            "background-color": QualityColor
                        }).find('p').html(qualityLabel);
                    }
                } else {
                    if (!IsOtherInventory) {
                        if (!IsHotbar) {
                            $(".player-inventory").find("[data-slot=" + item.slot + "]").find(".item-slot-quality-bar").css({
                                "width": qualityLabel + "%",
                                "background-color": QualityColor
                            }).find('p').html(qualityLabel);
                        } else {
                            $(".z-hotbar-inventory").find("[data-zhotbarslot=" + item.slot + "]").find(".item-slot-quality-bar").css({
                                "width": qualityLabel + "%",
                                "background-color": QualityColor
                            }).find('p').html(qualityLabel);
                        }
                    } else {
                        $(".other-inventory").find("[data-slot=" + item.slot + "]").find(".item-slot-quality-bar").css({
                            "width": qualityLabel + "%",
                            "background-color": QualityColor
                        }).find('p').html(qualityLabel);
                    }
                }
            }
        }
    }

    Inventory.Open = function(data) {
        slotsxd = data.slots;
        buttonsMenuEvents();
		buttonsMenuEventsarriba();
        totalWeight = 0;
        totalWeightOther = 0;
        $("#nearPlayers").html("");
        $("#item-amount").val("1");
        $(".player-inventory").find(".item-slot").remove();
        $(".player-inventory").find(".item-money").remove();

        $(".ply-hotbar-inventory").find(".item-slot").remove();

        if (requiredItemOpen) {
            $(".requiredItem-container").hide();
            requiredItemOpen = false;
        }

        $("#qb-inventory1").removeClass("slide-right").fadeIn(300);
        if (data.other != null && data.other != "") {
            $(".other-inventory").attr("data-inventory", data.other.name);
        } else {
            $(".other-inventory").attr("data-inventory", 0);
        }
        var firstSlots = $(".player-inventory-first");
        for (i = 1; i < 6; i++) {
            firstSlots.append(
                '<div class="item-slot" data-slot="' +
                i +
                '"><div class="item-slot-key"><p>' +
                i +
                '</p></div><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>'
            );
        }
        $(".player-inventory").append(firstSlots);

        // Inventory
        for (i = 6; i < (data.slots + 1); i++) {
            if (i == 41) {

            } else {
                if (i < data.slots) {

                    $(".player-inventory").append('<div class="item-slot" data-slot="' + i + '"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>');


                } else {

                }
            }





        }
        $(".player-inventory").append('<div class="item-money" data-slot="20"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>');



        if (data.other != null && data.other != "") {
            $(".oth-inv-container, .other-inv-info").show();
            $("#item-use").hide();
            
            $(".ply-iteminfo-container").removeClass("inv-normal");
            


            for (i = 1; i < (data.other.slots + 1); i++) {
                $(".other-inventory").append('<div class="item-slot" data-slot="' + i + '"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>');
            }

        } else {
            $(".oth-inv-container, .other-inv-info").hide();
            $("#item-use").show();


            for (i = 1; i < (Inventory.dropslots + 1); i++) {
                $(".other-inventory").append('<div class="item-slot" data-slot="' + i + '"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>');
            }
            $(".other-inventory .item-slot").css({
                "background-color": "rgba(0, 0, 0)"
            });
        }

        if (data.inventory !== null) {
            $.each(data.inventory, function(i, item) {
                if (item != null) {
                    totalWeight += (item.weight * item.amount);
                    var ItemLabel = '<div class="item-slot-label"><p>' + item.label + '</p></div>';
                    if ((item.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(item.name)) {
                            ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + item.label + '</p></div>';
                        }
                    }
                    if (item.slot < 6) {
                        $(".player-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag");
                        $(".player-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-key"><p>' + item.slot + '</p></div><div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                        $(".player-inventory").find("[data-slot=" + item.slot + "]").data("item", item);
                    } else if (item.slot == 41) {
                        $(".player-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag");
                        $(".player-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                        $(".player-inventory").find("[data-slot=" + item.slot + "]").data("item", item);
                    } else {
                        if (item.slot != data.slots) {
                            $(".player-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag");
                            $(".player-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                            $(".player-inventory").find("[data-slot=" + item.slot + "]").data("item", item);
                        } else {
                            $(".player-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag-money");

                            $(".player-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                            $(".player-inventory").find("[data-slot=" + item.slot + "]").data("item", item);

                        }

                    }
                    Inventory.QualityCheck(item, false, false);
                }
            });
        }

        if ((data.other != null && data.other != "") && data.other.inventory != null) {
            $.each(data.other.inventory, function(i, item) {
                if (item != null) {
                    totalWeightOther += (item.weight * item.amount);
                    var ItemLabel = '<div class="item-slot-label"><p>' + item.label + '</p></div>';
                    if ((item.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(item.name)) {
                            ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + item.label + '</p></div>';
                        }
                    }
                    $(".other-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag");
                    if (item.price != null) {
                        $(".other-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>(' + item.amount + ') $' + item.price + '</p></div>' + ItemLabel);
                    } else {
                        $(".other-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    }
                    $(".other-inventory").find("[data-slot=" + item.slot + "]").data("item", item);
                    Inventory.QualityCheck(item, false, true);
                }
            });
        }
        let percent = ((totalWeight / 1000).toFixed(2) / (data.maxweight / 1000).toFixed(2))*100;
        $("#enUsoPersonal").css("width",percent+"%");
        
        playerMaxWeight = data.maxweight;
        if (data.other != null) {
            var name = data.other.name.toString()
            if (name != null && (name.split("-")[0] == "itemshop" || name == "crafting")) {
                $("#other-inv-label").html(data.other.label);
            } else {
                $("#other-inv-label").html(data.other.label)
                $("#other-inv-weight").html("Weight: " + (totalWeightOther / 1000).toFixed(2) + " / " + (data.other.maxweight / 1000).toFixed(2))
            }
            otherMaxWeight = data.other.maxweight;
            otherLabel = data.other.label;
        } else {
            $("#other-inv-label").html(Inventory.droplabel)
            $("#other-inv-weight").html("Weight: " + (totalWeightOther / 1000).toFixed(2) + " / " + (Inventory.dropmaxweight / 1000).toFixed(2))
            otherMaxWeight = Inventory.dropmaxweight;
            otherLabel = Inventory.droplabel;
        }

        $.each(data.maxammo, function(index, ammotype) {
            $("#" + index + "_ammo").find('.ammo-box-amount').css({ "height": "0%" });
        });

        if (data.Ammo !== null) {
            $.each(data.Ammo, function(i, amount) {
                var Handler = i.split("_");
                var Type = Handler[1].toLowerCase();
                if (amount > data.maxammo[Type]) {
                    amount = data.maxammo[Type]
                }
                var Percentage = (amount / data.maxammo[Type] * 100)

                $("#" + Type + "_ammo").find('.ammo-box-amount').css({ "height": Percentage + "%" });
                $("#" + Type + "_ammo").find('span').html(amount + "x");
            });
        }

        handleDragDrop();
    };

    Inventory.Close = function() {
        $(".item-slot").css("border", "1px solid rgba(255, 255, 255, 0.1)");
        $(".ply-hotbar-inventory").css("display", "block");
        $(".ply-iteminfo-container").css("display", "none");
		
			 $("#qb-inventory1").addClass("slide-right");
        $("#qb-inventory1").addClass("slide-right").fadeOut(300, function() {
            $(".item-slot").remove();
            $(".item-money").remove();
        });
        $(".combine-option-container").hide();

        if ($("#rob-money").length) {
            $("#rob-money").remove();
        }
        $.post("https://qb-inventory/CloseInventory", JSON.stringify({}));

        if (AttachmentScreenActive) {
;
    $("#qb-inventory1").css({ "display": "none", "left": "13vw" });
    $(".weapon-attachments-container").css({"display": "none" });
            AttachmentScreenActive = false;
        }

        if (ClickedItemData !== null) {
            $("#weapon-attachments").fadeOut(250, function() {
                $("#weapon-attachments").remove();
                ClickedItemData = {};
            });
        }
				$('.ply-iteminfo-container').css('display', 'none');
    };

    Inventory.Update = function(data) {
        totalWeight = 0;
        totalWeightOther = 0;
        $(".player-inventory").find(".item-slot").remove();
		$(".player-inventory-first").find(".item-slot").remove();
        $(".ply-hotbar-inventory").find(".item-slot").remove();
        if (data.error) {
            Inventory.Error();
        }
		
        var firstSlots = $(".player-inventory-first");
        for (i = 1; i < 6; i++) {
            firstSlots.append(
                '<div class="item-slot" data-slot="' +
                i +
                '"><div class="item-slot-key"><p>' +
                i +
                '</p></div><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>'
            );
        }
        $(".player-inventory").append(firstSlots);
        for (i = 1; i < (data.slots + 1); i++) {
            if (i == 41) {
                $(".player-inventory").append('<div class="item-slot" data-slot="' + i + '"><div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>');
            } else {
                if (data.slots < data.slots) {
                    $(".player-inventory").append('<div class="item-slot" data-slot="' + i + '"><div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div></div>');

                }
            }
        }

        $.each(data.inventory, function(i, item) {
            if (item != null) {
                totalWeight += (item.weight * item.amount);
                if (item.slot < 6) {
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag");
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-key"><p>' + item.slot + '</p></div><div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + item.label + '</p></div>');
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").data("item", item);
                } else if (item.slot == 41) {
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag");
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-key"><p>6 <i class="fas fa-lock"></i></p></div><div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + item.label + '</p></div>');
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").data("item", item);

                } else {
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").addClass("item-drag");
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").html('<div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + item.label + '</p></div>');
                    $(".player-inventory").find("[data-slot=" + item.slot + "]").data("item", item);
                }
            }
        });

        $("#player-inv-weight").html("Weight: " + (totalWeight / 1000).toFixed(2) + " / " + (data.maxweight / 1000).toFixed(2));

        handleDragDrop();
    };

    Inventory.ToggleHotbar = function(data) {
        if (data.open) {
            $(".z-hotbar-inventory").html("");
            for (i = 1; i < 6; i++) {
                var elem = '<div class="z-hotbar-item-slot" data-zhotbarslot="' + i + '"> <div class="z-hotbar-item-slot-key"><p>' + i + '</p></div><div class="z-hotbar-item-slot-img"></div><div class="z-hotbar-item-slot-label"><p>&nbsp;</p></div></div>'
                $(".z-hotbar-inventory").append(elem);
            }
            $.each(data.items, function(i, item) {
                if (item != null) {
                    var ItemLabel = '<div class="item-slot-label"><p>' + item.label + '</p></div>';
                    if ((item.name).split("_")[0] == "weapon") {
                        if (!Inventory.IsWeaponBlocked(item.name)) {
                            ItemLabel = '<div class="item-slot-quality"><div class="item-slot-quality-bar"><p>100</p></div></div><div class="item-slot-label"><p>' + item.label + '</p></div>';
                        }
                    }
                    if (item.slot == 41) {
                    } else {
                        $(".z-hotbar-inventory").find("[data-zhotbarslot=" + item.slot + "]").html('<div class="z-hotbar-item-slot-key"><p>' + item.slot + '</p></div><div class="z-hotbar-item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div><div class="z-hotbar-item-slot-amount"><p>' + item.amount + ' (' + ((item.weight * item.amount) / 1000).toFixed(1) + ')</p></div>' + ItemLabel);
                    }
                    Inventory.QualityCheck(item, true, false);
                }
            });
            $(".z-hotbar-inventory").fadeIn(300);

        } else {
            $(".z-hotbar-inventory").addClass("slide-down").fadeOut(300, function() {
                $(".z-hotbar-inventory").html("");
                $(this).removeClass("slide-down");
            });
        }
    }

    Inventory.UseItem = function(data) {
        $(".itembox-container").hide();
        $(".itembox-container").fadeIn(250);
        $("#itembox-action").html("<p>Used</p>");
        $("#itembox-label").html("<p>" + data.item.label + "</p>");
        $("#itembox-image").html('<div class="item-slot-img"><img src="images/' + data.item.image + '" alt="' + data.item.name + '" /></div>')
        setTimeout(function() {
            $(".itembox-container").fadeOut(250);
        }, 2000)
    };

    var itemBoxtimer = null;
    var requiredTimeout = null;

    Inventory.itemBox = function(data) {
        if (itemBoxtimer !== null) {
            clearTimeout(itemBoxtimer)
        }
        var type = "Used"
        if (data.type == "add") {
            type = "Received";
        } else if (data.type == "remove") {
            type = "Removed";
        }

        var $itembox = $(".itembox-container.template").clone();
        $itembox.removeClass('template');
        $itembox.html('<div id="itembox-action"><p>' + type + '</p></div><div id="itembox-label"><p>' + data.item.label + '</p></div><div class="item-slot-img"><img src="images/' + data.item.image + '" alt="' + data.item.name + '" /></div>');
        $(".itemboxes-container").prepend($itembox);
        $itembox.fadeIn(250);
        setTimeout(function() {
            $.when($itembox.fadeOut(300)).done(function() {
                $itembox.remove()
            });
        }, 3000);
    };

    Inventory.RequiredItem = function(data) {
        if (requiredTimeout !== null) {
            clearTimeout(requiredTimeout)
        }
        if (data.toggle) {
            if (!requiredItemOpen) {
                $(".requiredItem-container").html("");
                $.each(data.items, function(index, item) {
                    var element = '<div class="requiredItem-box"><div id="requiredItem-action">Requerido</div><div id="requiredItem-label"><p>' + item.label + '</p></div><div id="requiredItem-image"><div class="item-slot-img"><img src="images/' + item.image + '" alt="' + item.name + '" /></div></div></div>'
                    $(".requiredItem-container").hide();
                    $(".requiredItem-container").append(element);
                    $(".requiredItem-container").fadeIn(100);
                });
                requiredItemOpen = true;
            }
        } else {
            $(".requiredItem-container").fadeOut(100);
            requiredTimeout = setTimeout(function() {
                $(".requiredItem-container").html("");
                requiredItemOpen = false;
            }, 100)
        }
    };

    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch (event.data.action) {
                case "open":
                    Inventory.Open(event.data);
                    break;
                case "close":
                    Inventory.Close();
                    break;
                case "update":
                    Inventory.Update(event.data);
                    break;
                case "itemBox":
                    Inventory.itemBox(event.data);
                    break;
                case "requiredItem":
                    Inventory.RequiredItem(event.data);
                    break;
                case "toggleHotbar":
                    Inventory.ToggleHotbar(event.data);
                    break;
                case "nearPlayers":
                    $("#nearPlayers").html("");

                    $.each(event.data.players, function(index, player) {
                        $("#nearPlayers").append('<button class="nearbyPlayerButton" data-player="' + player.player + '">ID ' + player.player + "</button>");
                        if (index == event.data.players.length - 1) {
                            $("#nearPlayers").append('<button class="cerrar-players">Cancelar</button>');

                        }
                    });

                    $(".nearbyPlayerButton").click(function() {

                        $("#nearPlayers").html("");
                        player = $(this).data("player");
                        count = $("#item-amount").val();
                        if (count == 0) { count = fromData.count }
                        Inventory.Close();
                        $.post(
                            "https://qb-inventory/GiveItem",
                            JSON.stringify({

                                player: player,
                                inventory : event.data.inventory,
                                item: event.data.item,
                                amount: parseInt(count),
                                slot: event.data.slot,
                            }),
                        );
                        console.log(event.data.item.name)
                    });
                    $(".cerrar-players").click(function() {

                        $("#nearPlayers").fadeOut(300, function() {
                            $(this).html("").show();
                        });

                    });


                case "RobMoney":
                    break;
                case "ocultarHotbar":
                    $(".z-hotbar-inventory").addClass("slide-down").fadeOut(300, function() {
                        $(this).removeClass("slide-down");
                    });
                    break;
                case "SetCraftResult":
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").css("opacity", "1.0");
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").html('<div class="item-slot-img"><img src="images/' + event.data.fromData.image + '" alt="' + event.data.fromData.name + '" /></div><div class="item-slot-amount"><p>' + event.data.fromData.amount + ' (' + ((event.data.fromData.weight * event.data.fromData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + event.data.fromData.label + '</p></div>');
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").data("item", event.data.fromData);
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").addClass("item-drag");
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").removeClass("item-nodrag");
                    handleDragDrop()
                    break;
                case "ClearCraftResult":
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").css("opacity", "0.5");
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").html('<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>');
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").removeData("item");
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").addClass("item-nodrag");
                    $(".other-inventory").find("[data-slot=" + event.data.lastslot + "]").removeClass("item-drag");
                    handleDragDrop()
                    break;
                case "UpdateCraftItems":
                    $(".other-inventory").find("[data-slot=" + event.data.slot + "]").html('<div class="item-slot-img"><img src="images/' + event.data.fromData.image + '" alt="' + event.data.fromData.name + '" /></div><div class="item-slot-amount"><p>' + event.data.fromData.amount + ' (' + ((event.data.fromData.weight * event.data.fromData.amount) / 1000).toFixed(1) + ')</p></div><div class="item-slot-label"><p>' + event.data.fromData.label + '</p></div>');
                    $(".other-inventory").find("[data-slot=" + event.data.slot + "]").data("item", event.data.fromData);
                    handleDragDrop()
                    break;
                case "ClearCraftItems":
                    $(".other-inventory").find("[data-slot=" + event.data.slot + "]").html('<div class="item-slot-img"></div><div class="item-slot-label"><p>&nbsp;</p></div>');
                    $(".other-inventory").find("[data-slot=" + event.data.slot + "]").removeData("item");
                    handleDragDrop()
                    break;
            }
        })
    }

})();

$(document).on('click', '#rob-money', function(e) {
    e.preventDefault();
    var TargetId = $(this).data('TargetId');
    $.post('https://qb-inventory/RobMoney', JSON.stringify({
        TargetId: TargetId
    }));
    $("#rob-money").remove();
});

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        switch (event.data.action) {
            case "close":
                Inventory.Close();
                break
        }
    })
});

function buttonsMenuEvents(){

    $(".lateral-menu .boton").off("click").on("click", function(){
        let action = $(this).attr("action");
        let event = $(this).attr("event");
        $.post('https://qb-inventory/inventory_options', JSON.stringify({event: event, action: action}));
    });

}

function buttonsMenuEventsarriba(){

    $(".menu-superior .boton").off("click").on("click", function(){
        let action = $(this).attr("action");
        $.post('https://qb-inventory/drogas', JSON.stringify({action: action}));
    });

}



function dardinero() {

  $.post('https://qb-inventory/dardinero', JSON.stringify())
}

function ropamenuopen() {

  $.post('https://qb-inventory/ropamenuopen', JSON.stringify())
}

function carmenuopen() {

  $.post('https://qb-inventory/carmenuopen', JSON.stringify())
}

