var $ajax = $(".js-example-data-ajax");

function formatRepo(repo) {

    if (repo.loading) return repo.text;

    var markup = "<div class='select2-result-repository clearfix'>" +
        "<div class='select2-result-repository__meta'>" +
        "<div class='select2-result-repository__title'>" + repo.AdSoyad + "</div>";

    markup += "<div class='select2-result-repository__statistics'>" +
        "<div class='select2-result-repository__unite'><i class='fa fa-flash'></i>" + repo.SicilNo + "</div>" +
        "<div class='select2-result-repository__fabrika'><i class='fa fa-star'></i>" + repo.Yoneticilik + "</div>" +

        "<div class='select2-result-repository__kurTel'><i class='fa fa-eye'></i>" + repo.Mudurluk + "</div>" +
    "</div>" +
    "</div></div>";

    return markup;
}

function formatRepoSelection(repo) {
    return repo.AdSoyad || repo.text;
}

$ajax.select2({
    ajax: {
        url: "/Uyeler/PersonelGetirJson",
        dataType: 'json',
        delay: 250,
        type: "POST",
        data: function (params) {
            return {
                q: params.term, // search term
            };
        },
        processResults: function (data) {
            return {
                results: data,
            };
        },
        cache: true
    },
    escapeMarkup: function (markup) { return markup; },
    minimumInputLength: 2,
    maximumInputLength: 11,
    templateResult: formatRepo,
    templateSelection: formatRepoSelection
});

