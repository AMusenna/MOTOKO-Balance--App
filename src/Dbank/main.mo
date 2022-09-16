import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor Dbank {
 stable var currentValue: Float = 300;
 //currentValue := 300;

stable var startTime = Time.now();
//startTime := Time.now(); 
Debug.print(debug_show(startTime));

public func topUp(amount: Float) {
  currentValue += amount;
  Debug.print(debug_show(currentValue));
};

public func topDown(amount: Float) {
  
  let tempValue: Float = currentValue - amount;

  if (tempValue >= 0) {
     currentValue -= amount;
     Debug.print(debug_show(currentValue));
  } else {
    Debug.print(debug_show("İts very big for main number !"))
  }

};

public query func checkBalance(): async Float {
  return currentValue;
};


//topUp();
//topDown();

public func compound() {
  let currentTime = Time.now();
  let timeElapsendNS = currentTime - startTime;
  let timeElapsendS = timeElapsendNS / 1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsendS));
  startTime :=  currentTime;
  }

}
