/*$(document).ready(function() {
});*/

function setTag(tag) {
  var className = "tag_" + tag;
  $(".example").hide();
  $("." + className).show('');
}

function setAllTags() {
  $(".example").show('slow');
}
