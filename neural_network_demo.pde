float[][] training_sets = {
  { 1, 0, 1, 1, 0, 1 },
  { 1, 1, 1, 0, 0, 1 },
  { 1, 0, 0, 1, 1, 1 },
  { 0, 0, 1, 1, 0, 1 },
  { 1, 0, 1, 1, 0, 0 },
  { 0, 1, 1, 0, 1, 0 },
  { 0, 1, 1, 0, 1, 0 },
  { 1, 1, 0, 1, 1, 1 },
  { 0, 1, 1, 0, 0, 1 },
  { 1, 0, 1, 0, 1, 1 },
  
};
float[] outputs = {
  0,
  1,
  0,
  0,
  0,
  1,
  1,
  1,
  0,
  0
};

float[] weights = { 0.15, 0.15, 0.15, 0.15, 0.15, 0.15 };
float learning_coefficient = 0.18;

void setup() {
  noLoop();
}


float sigmoid(float value) { return atan(value); }

float calc_output(float[] inputs) {
  float sum = 0;
  
  for (int i=0; i < inputs.length; i++) {
    sum += inputs[i] * weights[i];
  }
  
  // now you have a sum of the products, return the sigmoid of it
  return sigmoid(sum);
}

float train(float[] inputs, float expected_output, float neural_network_output) {
  float err = expected_output - neural_network_output;
  
  for (int i=0; i< weights.length; i++) {
    weights[i] = weights[i] + err * inputs[i] * learning_coefficient;
  }
  
  return err;
}



void draw() {
  float[] inputs = new float[6];
  float output;
  float neural_network_output;
  float error;
  
  
  for (int i=0; i<10000; i++) {
    for (int p=0; p < training_sets.length; p++) {
      inputs = training_sets[p];
      output = outputs[p];
  
      neural_network_output = calc_output(inputs);
      error = train(inputs, output, neural_network_output);
      
      print_network(weights, output);
      println("Ao=" + neural_network_output + ", err=" + error);
    }
    println("\n===== Training Iteration : " + i + "\n");
  }
}








void print_network(float[] inputs, float output) {
  for (int j=0; j<inputs.length; j++) { 
    print(inputs[j] + ", "); 
  }
  print("   =>   " + output + "   ");
}
