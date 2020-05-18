package kabam.rotmg.messaging.impl.outgoing
{
   import flash.utils.IDataOutput;
   import kabam.rotmg.messaging.impl.data.WorldPosData;
   
   public class PlayerShoot extends OutgoingMessage
   {
      public var time_:int;
      public var startingPos_:WorldPosData;
      public var angle_:Number;
      public var ability_:Boolean;
      public var numShots_:int;
      
      public function PlayerShoot(id:uint, callback:Function)
      {
         this.startingPos_ = new WorldPosData();
         super(id,callback);
      }
      
      override public function writeToOutput(data:IDataOutput) : void
      {
         data.writeInt(this.time_);
         this.startingPos_.writeToOutput(data);
         data.writeFloat(this.angle_);
         data.writeBoolean(ability_);
         if (numShots_ != 1)
         {
            data.writeByte(numShots_);
         }
      }
      
      override public function toString() : String
      {
         return formatToString("PLAYERSHOOT","time_","startingPos_","angle_", "ability_", "numShots_");
      }
   }
}
