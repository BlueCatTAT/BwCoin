; (function($) {
   
    $.fn.jSelect = function(settings) {
        var defaults = {
            viewSelector: ".select-view",
            valueSelector: ".select-value",
            textSelector: ".select-text",
            iconSelector: ".select-icon",
            iconClickAble: true,
            itemContainerSelector: ".options",
            itemSelector: ".options > li",
            completeFunction: function() {}
        };
        var options = $.extend(defaults, settings || {});
        var div = this;
        var selectView = div.find(options.viewSelector);
        var selectValueInput = selectView.find(options.valueSelector);
        var selectText = selectView.find(options.textSelector);
        var selectIcon = selectView.find(options.iconSelector);
        var selectItemContainer = div.find(options.itemContainerSelector);
        var items = div.find(options.itemSelector);
        if (options.iconClickAble) {
            selectIcon.on("click",
            function() {
                selectItemContainerToggle();
                return false;
            });
        } else {
            selectView.on("click",
            function() {
                selectItemContainerToggle();
                return false;
            });
        }
        items.each(function() {
            var item = $(this);
            item.on("click",
            function() {
                var value = $(this).data("value");
                var text = $(this).text();
                selectValueInput.val(value);
                selectText.text(text);
                selectItemContainer.slideUp("fast");
                options.completeFunction();
                return false;
            });
        });
        function selectItemContainerToggle() {
            selectItemContainer.slideToggle("fast");
        }
    }
})(jQuery);