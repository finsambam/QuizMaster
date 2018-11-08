((w) => {
  "use strict";
  
  let current_fs, next_fs, previous_fs; //fieldsets
  let left, opacity, scale; //fieldset properties which we will animate
  let animating; //flag to prevent quick multi-click glitches

  $(".next").on("click",function() {
    if(animating) return false;
    animating = true;
    
    current_fs = $(this).parent();
    next_fs = $(this).parent().next();
    
    //activate next step on progressbar using the index of next_fs
    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
    
    //show the next fieldset
    next_fs.show(); 
    //hide the current fieldset with style
    current_fs.animate({opacity: 0}, {
      step: (now, mx) => {
        scale = 1 - (1 - now) * 0.2;
        left = (now * 50)+"%";
        opacity = 1 - now;
        current_fs.css({'transform': 'scale('+scale+')'});
        next_fs.css({'left': left, 'opacity': opacity});
      }, 
      duration: 500, 
      complete: () => {
        current_fs.hide();
        animating = false;
      }, 
      easing: 'easeOutQuint'
    });
  });

  $(".previous").on("click", function() {
    if(animating) return false;
    animating = true;
    
    current_fs = $(this).parent();
    previous_fs = $(this).parent().prev();
    
    //de-activate current step on progressbar
    $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
    
    //show the previous fieldset
    previous_fs.show(); 
    //hide the current fieldset with style
    current_fs.animate({opacity: 0}, {
      step: (now, mx) => {
        scale = 0.8 + (1 - now) * 0.2;
        left = ((1-now) * 50)+"%";
        opacity = 1 - now;
        current_fs.css({'left': left});
        previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
      }, 
      duration: 500, 
      complete: () => {
        current_fs.hide();
        animating = false;
      }, 
      easing: 'easeOutQuint'
    });
  });

  $(".submit").on("click", function(){
    let params = {
      id: w.location.href.split("/")[4],
      answers: []
    };
    let isConfirmed = confirm("Are you sure?");
    if (isConfirmed) {
      const fieldsets = $("#msform fieldset").toArray();
      fieldsets.forEach((item) => {
        const dataId = $(item).attr("data-id");
        const data = {
          id: dataId,
          answer: $(`fieldset[data-id=${dataId}] .answer`).val()
        };
        params.answers.push(data);
      })
      console.log(params);

      $.ajax({
        url: `/quizzes/${params.id}/submitQuiz`,
        type: "POST",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(params)
      }).done((result) => {
        console.log(result);
        fireResulModal(result.data.result);
      }).fail((j, t, e) => {
        console.log(j, t, e);
      })
    }; 
    return false;
  });

  $("#resultModal").on("hidden.bs.modal", () => { 
    window.location="/";
  });

  let fireResulModal = (r) => {
    $("#result-email").val(r.email);
    $("#result-start-time").val(r.start_time);
    $("#result-end-time").val(r.score);
    $("#result-score").val(r.submit_time);

    //show result modal
    $("#resultModal").modal('show');
  };
})(window);
