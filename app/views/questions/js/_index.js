((reff) => {
  "use strict";

  $(document).on("turbolinks:load", () => {
    initTable();

  });

  const initTable = () => {
    const tableConfig = {
      url: "/questions/get_all",
      toolbar: "#toolbar",
      search: true,
      striped: true,
      pagination: true,
      sidePagination: "client",
      showColumns: false,
      smartDisplay: false,
      sortOrder: "asc",
      columns: [
        [
          { field: "id", title: "ID", align: "left", halign: "center", valign: "middle", rowspan: 2},
          { field: "text", title: "Questions", align: "left", halign: "center", sortable: true, valign: "middle", rowspan: 2 },
          { field: "answer", title: "Correct Answer", align: "left", halign: "center", sortable: true, valign: "middle", rowspan: 2 },
          { field: "question_type", title: "Question Type", align: "left", halign: "center", sortable: true, valign: "middle", rowspan: 2 },
          { title: "Answer Options", align: "center", colspan: 4},
          { title: "Actions", align: "center", valign: "middle", rowspan: 2}
        ],
        [
          { field: "answer_option_a", title: "A", align: "left", halign: "center", sortable: true },
          { field: "answer_option_b", title: "B", align: "left", halign: "center", sortable: true },
          { field: "answer_option_c", title: "C", align: "left", halign: "center", sortable: true },
          { field: "answer_option_d", title: "D", align: "left", halign: "center", sortable: true }
        ]
      ]
    }
    $("table#questions-table").bootstrapTable(tableConfig);
  }

})({
  ajaxOpt: {
    type: "GET",
    data: null,
    datatype: "JSON",
    url: ""
  }
})