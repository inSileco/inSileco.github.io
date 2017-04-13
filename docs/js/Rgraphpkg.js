document.getElementById('Graphpkgs').innerHTML += "cool0";

var pkg = YAML.load("../data/Rpkgs.yml");
document.getElementById('Graphpkgs').innerHTML += "cool1";
var categ = [];
for (var i=0; i<pkg.length; i++){
  categ.push(pkg[i].category);
}
var ucateg = categ.unique();
var uscateg = ucateg.sort();

document.getElementById('Graphpkgs').innerHTML += "cool";

for (var i=0; i<uscateg.length; i++){
  document.getElementById('Graphpkgs').innerHTML += "<h3>"
  + uscateg[i] + "</h3>" + "<hr>" + "<ol>";
  for (var j=0; j<pkg.length; j++){
    if (pkg[j].category === uscateg[i]){
      if (!isEmpty(pkg[j].github)) {
        var github = " <a href='https://github.com/" + pkg[j].github + "'><i class='fa fa-github'></i></a>";
      } else {
        var github = "";
      }
      if (!isEmpty(pkg[j].bitbuck)) {
        var bitbuck = " <a href='https://bitbuck.org/" + pkg[j].bitbuck + "'><i class='fa fa-bitbucket'></i></a>";
      } else {
        var bitbuck = "";
      }
      if (!isEmpty(pkg[j].website)) {
       var website = " <a href=" + pkg[j].website + "><i class='fa fa-globe'></i></a>";
      } else {
       var website = "";
      }
      if (!isEmpty(pkg[j].doi)) {
        var doi = " <a href='https://doi.org/" + pkg[j].doi +"'><i class='fa fa-link'></i></a>";
      } else {
        var doi = "";
      }
      if (!isEmpty(pkg[j].pdf)) {
        var pdf =  " <a href=" + pkg[j].pdf + "><i class='fa fa-file-pdf-o'></i></a>";
      } else {
        var pdf = "";
      }
      document.getElementById('Graphpkgs').innerHTML += "<li>"+
      "<b> <a href='https://cran.r-project.org/web/packages/"
      + pkg[j].namepkg + "/index.html'>" + pkg[j].namepkg + "</a>: "
      + pkg[j].text + github + bitbuck + website + doi + pdf;
    }
  }
  document.getElementById('Graphpkgs').innerHTML += "</ol><br/>";
}


// {% assign pkg_by_cat = site.data.Rpkgs | group_by:"category" | sort:"name" %}
//
// {% for pkg_cat in pkg_by_cat %}
//   <br/>
//   <h3 id="{{pkg_cat.name}}"> {{pkg_cat.name}} </h3>
//   <ul>
//     {% for pkg in pkg_cat.items %}
//       <li>
//         <a href="https://cran.r-project.org/web/packages/{{pkg.namepkg}}/index.html">{{pkg.namepkg}}</a>:   {{pkg.text}}
//         {% if pkg.github %} <a href="https://github.com/{{pkg.github}}"><i class="fa fa-github"></i></a> {% endif %}
//         {% if pkg.bitbuck %} <a href="https://bitbuck.org/{{pkg.bitbuck}}"><i class="fa fa-bitbuck"></i></a> {% endif %}
//         {% if pkg.website %} <a href="{{pkg.website}}"><i class="fa fa-globe"></i></a> {% endif %}
//         {% if pkg.doi %} <a href="https://doi.org/{{pkg.doi}}"><i class="fa fa-link"></i></a> {% endif %}
//         {% if pkg.pdf %}  <a href="{{pkg.pdf}}"><i class="fa fa-file-pdf-o"></i></a> {% endif %}
//
//       </li>
//     {% endfor %}
//   </ul>
// {% endfor %}
