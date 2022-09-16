import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor Dbank {
 stable var currentValue = 300;
 //currentValue := 100;

 let id = 324234234134124;

//  Debug.print(debug_show(currentValue));

let startTime = Time.now();
Debug.print(debug_show(startTime));

public func topUp(amount: Nat) {
  currentValue += amount;
  Debug.print(debug_show(currentValue));
};

public func topDown(amount: Nat) {
  
  let tempValue: Int = currentValue - amount;

  if (tempValue >= 0) {
     currentValue -= amount;
     Debug.print(debug_show(currentValue));
  } else {
    Debug.print(debug_show("İts very big for main number !"))
  }

};

public query func checkBalance(): async Nat {
  return currentValue;
};


//topUp();
//topDown();

public func compound() {
  let currentTime = Time.now();
  let timeElapsendNS = currentTime - startTime;
  let timeElapsendNS = timeElapsendNS / 1000000000;
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsendNS));
  }

};
