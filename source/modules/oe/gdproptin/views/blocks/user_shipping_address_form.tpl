[{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]
[{if !$deladr}]
    [{assign var="deladr"  value=$oConfig->getRequestParameter('deladr')}]
[{/if}]

[{$smarty.block.parent}]

[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]

[{capture assign="optinValidationJS"}]
    [{strip}]
        $("#accUserSaveTop").click(function(event){
            $("#oegdproptin_deliveryaddress_error").hide();
            if ($('#oegdproptin_deliveryaddress').is(':visible') && $('#oegdproptin_deliveryaddress').is(':not(:checked)'))
            {
                event.preventDefault();
                $("#oegdproptin_deliveryaddress_error").show();
                $(this).submit();
                return false;
            } else {
                $("#oegdproptin_deliveryaddress_error").hide();
                $(this).submit();
            }
        });
    [{/strip}]
[{/capture}]

[{oxscript add=$optinValidationJS}]

[{if true == $oConfig->getConfigParam('blOeGdprOptinDeliveryAddress')}]
    [{if $oViewConf->getActiveTheme()=='azure'}]
        <p id="GdprShippingAddressOptin" style="[{if $delivadr || !$oView->showShipAddress()}]display: none;[{/if}]">
            <input type="hidden" id="oegdproptin_changeDelAddress" name="oegdproptin_changeDelAddress" value="0">
            <input type="checkbox" name="oegdproptin_deliveryaddress" id="oegdproptin_deliveryaddress" value="1">
            <label for="oegdproptin_deliveryaddress"><strong>[{oxmultilang ident="OEGDPROPTIN_STORE_DELIVERY_ADDRESS"}]</strong></label>
            <div id="oegdproptin_deliveryaddress_error" style="display:none;" class="inlineError">[{oxmultilang ident="OEGDPROPTIN_CONFIRM_USER_REGISTRATION_OPTIN" }]</div>
        </p>
    [{else}]
        <div class="clearfix"></div>
        <div id="GdprShippingAddressOptin" class="form-group" style="[{if $delivadr || !$oView->showShipAddress()}]display: none;[{/if}]">
            <div class="col-lg-12">
                <div class="checkbox">
                    <label class="req">
                        <input type="hidden" class="hidden" id="oegdproptin_changeDelAddress" name="oegdproptin_changeDelAddress" value="0">
                        <input type="checkbox" name="oegdproptin_deliveryaddress" id="oegdproptin_deliveryaddress" value="1" >
                        <strong>[{oxmultilang ident="OEGDPROPTIN_STORE_DELIVERY_ADDRESS"}]</strong>
                    </label>
                </div>
                <div id="oegdproptin_deliveryaddress_error" style="display:none;" class="text-danger">[{oxmultilang ident="OEGDPROPTIN_CONFIRM_USER_REGISTRATION_OPTIN" }]</div>
            </div>
        </div>
    [{/if}]
[{/if}]
