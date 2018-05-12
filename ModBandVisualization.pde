float barWidth;

void setup(){
  frameRate(60);

  fullScreen(P3D);
  background(0);

  prepareBandLib(16);
  colorMode(HSB, specSize, 100, 100);

  barWidth = width / maxSteps;
}

void draw(){
  stroke(0);
  fill(0, 16);
  rect(0, 0, width, height);

  // prepare data
  bandLibLogic();

  float x1, x2, y1, y2;

  for(int i = 0; i < maxSteps; i++)
  {
    // prepare line
    x1 = i * barWidth;
    y1 = height/2 - ( (i == 0) ? 0 : savedData[i-1] );
    x2 = (i + 1) * barWidth;
    y2 = height/2 - currentData[i];

    stroke(i*bandWidth, 100, 100);
    fill(i*bandWidth,100,100);
    rect(barWidth * i, height - currentData[i] * 8, barWidth, currentData[i] * 8);

    line(x1, y1, x2, y2);
  } 
}
