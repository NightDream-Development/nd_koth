$(document).ready(function() {
  window.addEventListener('message', function(event) {
      let data = event.data;

      // console.log('[UI:data]: ', data.time)

      if (data.toggle === false) {
        $(".hud-container").hide();
      } else {
        $(".hud-container").show();
      }
  
      if (data.team1 !== undefined) {
        $("#team-1-points").text(data.team1);
      }
  
      if (data.team2 !== undefined) {
        $("#team-2-points").text(data.team2);
      }
  
      if (data.team3 !== undefined) {
        $("#team-3-points").text(data.team3);
      }
  
      if (data.kingteam !== undefined) {
        $("#team-zone-king").text(data.kingteam);
      }
  
      if (data.time !== undefined) {
        $("#time-left").text(data.time);
      }
      
  });
});
