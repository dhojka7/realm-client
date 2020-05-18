package kabam.rotmg.messaging.impl.outgoing
{
   import flash.utils.IDataOutput;
   
   public class PlayerHit extends OutgoingMessage
   {
      public var bulletId_:int;
      
      public function PlayerHit(id:uint, callback:Function)
      {
         super(id,callback);
      }
      
      override public function writeToOutput(data:IDataOutput) : void
      {
         data.writeInt(this.bulletId_);
      }
      
      override public function toString() : String
      {
         return formatToString("PLAYERHIT","bulletId_","objectId_");
      }
   }
}
