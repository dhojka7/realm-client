package com.company.assembleegameclient.util {
import starling.utils.Color;

public class ItemData
{
    public static const T0_BIT:uint = 1 << 0;
    public static const T1_BIT:uint = 1 << 1;
    public static const T2_BIT:uint = 1 << 2;
    public static const T3_BIT:uint = 1 << 3;
    public static const T4_BIT:uint = 1 << 4;
    public static const T5_BIT:uint = 1 << 5;
    public static const T6_BIT:uint = 1 << 6;
    public static const T7_BIT:uint = 1 << 7;

    public static const MAX_HP_BIT:uint = 1 << 8;
    public static const MAX_MP_BIT:uint = 1 << 9;
    public static const ATTACK_BIT:uint = 1 << 10;
    public static const DEFENSE_BIT:uint = 1 << 11;
    public static const SPEED_BIT:uint = 1 << 12;
    public static const DEXTERITY_BIT:uint = 1 << 13;
    public static const VITALITY_BIT:uint = 1 << 14;
    public static const WISDOM_BIT:uint = 1 << 15;
    public static const RATE_OF_FIRE_BIT:uint = 1 << 16;
    public static const DAMAGE_BIT:uint = 1 << 17;
    public static const COOLDOWN_BIT:uint = 1 << 18;
    public static const FAME_BONUS_BIT:uint = 1 << 19;

    public static const COOLDOWN_MULTIPLIER:Number = 0.05;
    public static const DAMAGE_MULTIPLIER:Number = 0.05;
    public static const RATE_OF_FIRE_MULTIPLIER:Number = 0.05;

    public static function hasStat(data:int, bit:uint) : Boolean
    {
        if (data == -1) {
            return false;
        }
        return (uint(data) & bit) != 0
    }

    public static function getStat(data:int, bit:uint, multiplier:Number) : Number
    {
        var rank:int = getRank(data);
        if (rank == -1) {
            return 0;
        }
        var value:int = 0;
        if (hasStat(data, bit))
        {
            value += rank;
        }
        return value * multiplier;
    }

    public static function getRank(data:int) : int
    {
        if (data == -1){
            return -1;
        }
        if (hasStat(data, T0_BIT)) {
            return 1;
        }
        if (hasStat(data, T1_BIT)) {
            return 2;
        }
        if (hasStat(data, T2_BIT)) {
            return 3;
        }
        if (hasStat(data, T3_BIT)) {
            return 4;
        }
        if (hasStat(data, T4_BIT)) {
            return 5;
        }
        if (hasStat(data, T5_BIT)) {
            return 6;
        }
        if (hasStat(data, T6_BIT)) {
            return 7;
        }
        if (hasStat(data, T7_BIT)) {
            return 8;
        }
        return -1;
    }

    public static function getColor(data:int) : int
    {
        if (hasStat(data, ItemData.T0_BIT))
        {
            return 0x00a6ff;
        }
        else if (hasStat(data, ItemData.T1_BIT))
        {
            return 0x7300ff;
        }
        else if (ItemData.hasStat(data, ItemData.T2_BIT))
        {
            return 0xffc800;
        }
        else if (ItemData.hasStat(data, ItemData.T3_BIT))
        {
            return 0x84ff00;
        }
        else if (ItemData.hasStat(data, ItemData.T4_BIT))
        {
            return 0xf542e6;
        }
        else if (ItemData.hasStat(data, ItemData.T5_BIT))
        {
            return 0x00ffdd;
        }
        else if (ItemData.hasStat(data, ItemData.T6_BIT))
        {
            return 0xffffff;
        }
        else if (ItemData.hasStat(data, ItemData.T7_BIT))
        {
            return 0xff5500;
        }
        return -1;
    }

    public static function getColorString(data:int) : String
    {
        if (hasStat(data, ItemData.T0_BIT))
        {
            return "#00a6ff";
        }
        else if (hasStat(data, ItemData.T1_BIT))
        {
            return "#7300ff";
        }
        else if (ItemData.hasStat(data, ItemData.T2_BIT))
        {
            return "#ffc800";
        }
        else if (ItemData.hasStat(data, ItemData.T3_BIT))
        {
            return "#84ff00";
        }
        else if (ItemData.hasStat(data, ItemData.T4_BIT))
        {
            return "#f542e6";
        }
        else if (ItemData.hasStat(data, ItemData.T5_BIT))
        {
            return "#00ffdd";
        }
        else if (ItemData.hasStat(data, ItemData.T6_BIT))
        {
            return "#ffffff";
        }
        else if (ItemData.hasStat(data, ItemData.T7_BIT))
        {
            return "#ff5500";
        }
        return "";
    }
}
}
