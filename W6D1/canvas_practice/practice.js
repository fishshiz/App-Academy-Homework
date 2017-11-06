document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("myCanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "rgb(40, 30, 100)";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(300, 300, 120, 0, 2*Math.PI, true);
  ctx.strokeStyle = "rgb(180, 100, 45)";
  ctx.lineWidth = 12;
  ctx.stroke();

  ctx.fillStyle = "rgb(30, 140, 65)";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(300, 300, 100, 0, Math.PI, true);
  ctx.quadraticCurveTo(80, 60, 400, 300);
  ctx.lineWidth = 6;
  ctx.strokeStyle = "rgb(150, 150, 30)";
  ctx.stroke();

  ctx.fillStyle = "rgb(150, 150, 170)";
  ctx.fill();

  ctx.beginPath();
  ctx.arc(300, 300, 100, 0, Math.PI, false);
  ctx.quadraticCurveTo(500, 550, 400, 300);
  ctx.lineWidth = 6;
  ctx.strokeStyle = "rgb(150, 150, 30)";
  ctx.stroke();

  ctx.fillStyle = "rgb(130, 150, 170)";
  ctx.fill();
});
