const setPermition = (id) => {
  let general = $("#access_" + id + "_id").prop("checked");

  if (general == true) {
    $("#access_" + id + "_incluir").prop("checked", true);
    $("#access_" + id + "_alterar").prop("checked", true);
    $("#access_" + id + "_excluir").prop("checked", true);
  } else {
    $("#access_" + id + "_incluir").prop("checked", false);
    $("#access_" + id + "_alterar").prop("checked", false);
    $("#access_" + id + "_excluir").prop("checked", false);
  }
};
const setPartialPermition = (id, type) => {
  let partial = $("#access_" + id + "_" + type).prop("checked");

  if (partial == true) {
    $("#access_" + id + "_id").prop("checked", true);
  }
};
