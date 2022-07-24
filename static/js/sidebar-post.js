var x = document.querySelectorAll(".post-content h2, .addto-sidebar");
var i;
for (i = 0; i < x.length; i++) {
  document.write("<h1>"x.length"</h1>");
  if (x[i].id != "title") {
    id = "sidebar_post_id_" + i;
    x[i].id = id;
    if (x[i].tagName == "H1") {
      document.write("<h1> <a href='#" + id + "'>" + x[i].innerHTML + "</a></h1>");
    } else if (x[i].tagName == "H2") {
      document.write("<h2> <a href='#" + id + "'>" +  x[i].innerHTML + "</a></h2>");
    }
  }
}