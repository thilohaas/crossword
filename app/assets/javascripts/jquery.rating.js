/**
 * AJAX Voting
 */

(function ($, jQuery, undefined) {

    jQuery.fn.rating = function (options) {

        var options = $.extend(
            {},
            jQuery.fn.rating.defaults,
            options
        );

        return this.find('form').each(
            function (index, dom) {
                var ratingForm = $(dom);
                var defaultValue = $('input[type=radio][checked="checked"]', ratingForm).attr('value');
                if(!defaultValue) {
                    defaultValue = 0;
                }
                options.highlight(defaultValue, ratingForm);

                $('label.choice', ratingForm).each(function() {
                    $(this).off('.rating');

                    $(this).on('mouseover.rating', function() {
                        options.highlight($('input', this).attr('value'), ratingForm);
                    });
                    $(this).on('mouseout.rating', function() {
                        options.highlight(defaultValue, ratingForm);
                    });

                    $(this).on('click.rating', function(e) {
                        e.preventDefault();
                        $('input', this).attr('checked','checked');
                        defaultValue = parseInt($('input', this).attr('value'));
                        ratingForm.submit();
                    });
                });
            }
        );

    };

    jQuery.fn.rating.defaults = {
    };

    jQuery.fn.rating.defaults.highlight = function(value, ratingForm) {
        for(var i=1; i<=value; i++) {
            $(ratingForm).find('input[type=radio][value=' + i + ']').each(function() {
                $(this).parent().html($(this).parent().html().replace('☆', '★'));
            });
        }
        var start = (parseInt(value)+1);
        for(var i=start; i<=5; i++) {
            $(ratingForm).find('input[type=radio][value=' + i + ']').each(function() {
                $(this).parent().html($(this).parent().html().replace('★', '☆'));
            });
        }
    }
})(jQuery, jQuery);