package com.company.assembleegameclient.ui.panels.itemgrids.itemtiles
{
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.ui.SimpleText;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import kabam.rotmg.constants.ItemConstants;
   
   public class ItemTileSprite extends Sprite
   {
      
      protected static const DIM_FILTER:Array = [new ColorMatrixFilter([0.4,0,0,0,0,0,0.4,0,0,0,0,0,0.4,0,0,0,0,0,1,0])];
      
      private static const DOSE_MATRIX:Matrix = function():Matrix
      {
         var m:* = new Matrix();
         m.translate(10,5);
         return m;
      }();
       
      
      public var itemId:int;
      public var itemData:int;
      
      public var itemBitmap:Bitmap;
      
      public function ItemTileSprite()
      {
         super();
         this.itemBitmap = new Bitmap();
         addChild(this.itemBitmap);
         this.itemId = -1;
      }
      
      public function setDim(dim:Boolean) : void
      {
         filters = dim?DIM_FILTER:null;
      }
      
      public function setType(displayedItemType:int, displayedItemData:int) : void
      {
         var texture:BitmapData = null;
         var eqXML:XML = null;
         var tempText:SimpleText = null;
         this.itemId = displayedItemType;
         this.itemData = displayedItemData;
         if(this.itemId != ItemConstants.NO_ITEM)
         {
            texture = ObjectLibrary.getRedrawnTextureFromType(this.itemId,80,true);
            eqXML = ObjectLibrary.xmlLibrary_[this.itemId];
            if(eqXML && eqXML.hasOwnProperty("Doses"))
            {
               texture = texture.clone();
               tempText = new SimpleText(12,16777215,false,0,0);
               tempText.text = String(eqXML.Doses);
               tempText.updateMetrics();
               texture.draw(tempText,DOSE_MATRIX);
            }
            this.itemBitmap.bitmapData = texture;
            this.itemBitmap.x = -texture.width / 2;
            this.itemBitmap.y = -texture.height / 2;
            visible = true;
         }
         else
         {
            visible = false;
         }
      }
   }
}
