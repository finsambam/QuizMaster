((w) => {
  "use strict";

  $(document).on("turbolinks:load", () => {
    initQuestionType();
    questionType_onChange.apply();
  });

  const initQuestionType = () => {
    const selectedValue = $("select#question_question_type").val();
    collapseOptions(selectedValue);
  };

  const questionType_onChange = () => {
    $("select#question_question_type").on("change", function(e) {
      collapseOptions($(this).val());
    })
  };
  
  const collapseOptions = (val) => {
    if(val === "multiple choice"){
        $("div.options").fadeIn();
      }else{
        $("div.options").fadeOut();
      }
  };
})(window)