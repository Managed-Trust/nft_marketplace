import Principal "mo:base/Principal";
import Debug "mo:base/Debug";

actor class NFT(name : Text, owner : Principal,content : [Nat8]) = this {
  private let itemName = name;
  private var nftOwner = owner;
  private let imageBytes = content;
  private var refunded = false;
  // private let amountSinceLastTransaction = aSLastTransaction;
  // private let  callName = call;
  // private let  transactiotnDirection= tD ; // Assuming "incoming" or "outgoing"
  // private let  splittingRatio= sR;
  // private let  assetClass= aC ; // Assuming "ckBTC" or "ckETH" or other values
  // private let  fixedAssetAmount= fAA;
  // private let  minAssetAmount= minAA;
  // private let  maxAssetAmount= maxAA;
  // private let  multiSignSteps= mSS;
  // private let  fixedTimeRepeating = fTR; // Adjust the type based on your specific needs
  // private let  fixedTimeDelaying= fTD; // Adjust the type based on your specific needs
  // private let  apiEnablement= aE ;

  public query func getName() : async Text {
    return itemName;
  };

  public query func getOwner() : async Principal {
    return nftOwner;
  };

  public query func getAsset() : async [Nat8] {
    return imageBytes;
  };

  public query func getCanisterID() : async Principal {
    return Principal.fromActor(this);
  };

  public shared (msg) func transferOwnership(newOwner : Principal) : async Text {
    if (msg.caller == nftOwner) {
      nftOwner := newOwner;
      return "Success";
    } else {
      return "Unauthorized";
    };
  };
   public shared (msg) func getRefund() : async Text {
    if (msg.caller == nftOwner and refunded==false ) {
      refunded := true;
      return "Success";
    } else {
      return "Unauthorized";
    };
  };
};
