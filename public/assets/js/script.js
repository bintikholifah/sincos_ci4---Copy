$(document).on("click", "#btn-edit", function () {
  $(".modal-body #id-ruangan").val($(this).data("id"));
  $(".modal-body #kd_ruang").val($(this).data("kd"));
  $(".modal-body #nm_ruang").val($(this).data("nama"));
  $(".modal-body #kapasitas").val($(this).data("kps"));
});