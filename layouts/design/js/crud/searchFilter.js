// FILTER SEARCH
// Ejm: https://stackoverflow.com/a/45364861

function searchFilter() {
    // Ejm: https://stackoverflow.com/a/45364861
    var input, filter, ul, li, a, i;
    input = document.getElementById("searchfilter");
    filter = input.value.toUpperCase();
    ul = document.getElementById("divturnos");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}

// FIN