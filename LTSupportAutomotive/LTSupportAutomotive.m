//
//  Copyright (c) Dr. Michael Lauer Information Technology. All rights reserved.
//
#import "LTSupportAutomotive.h"

#define LTSUPPORTAUTOMOTIVE_STRINGS_PATH @"Frameworks/LTSupportAutomotive.framework/LTSupportAutomotive"

NSString* LTStringLookupOrNil( NSString* key )
{
    NSString* value = [[NSBundle bundleForClass:NSClassFromString(@"LTVIN")] localizedStringForKey:key value:nil table:nil];
    return [value isEqualToString:key] ? nil : value;
}

NSString* LTStringLookupWithPlaceholder( NSString* key, NSString* placeholder )
{
    NSString* value = [[NSBundle bundleForClass:NSClassFromString(@"LTVIN")] localizedStringForKey:key value:placeholder table:nil];
    return value;
}

void MyNSLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    va_list ap;
    va_start (ap, format);
    if ( ![format hasSuffix:@"\n"] )
    {
        format = [format stringByAppendingString:@"\n"];
    }
    NSString* body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    NSString* fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    fprintf( stderr, "%s (%s:%d) %s", functionName, [fileName UTF8String], lineNumber, body.UTF8String );
}

NSString* LTDataToString( NSData* d )
{
    NSString* s = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    return [[s stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
}

NSMutableArray<LTOBD2PID*>* allMode1Values()
{
    return @[[LTOBD2PID_SUPPORTED_COMMANDS1_00 pidForMode1],
             [LTOBD2PID_MONITOR_STATUS_SINCE_DTC_CLEARED_01 pidForMode1],
             //2 for Mode 02 only
             [LTOBD2PID_FUEL_SYSTEM_STATUS_03 pidForMode1],
             [LTOBD2PID_ENGINE_LOAD_04 pidForMode1],
             [LTOBD2PID_COOLANT_TEMP_05 pidForMode1],
             [LTOBD2PID_SHORT_TERM_FUEL_TRIM_1_06 pidForMode1],
             [LTOBD2PID_LONG_TERM_FUEL_TRIM_1_07 pidForMode1],
             [LTOBD2PID_SHORT_TERM_FUEL_TRIM_2_08 pidForMode1],
             [LTOBD2PID_LONG_TERM_FUEL_TRIM_2_09 pidForMode1],
             [LTOBD2PID_FUEL_PRESSURE_0A pidForMode1],
             [LTOBD2PID_INTAKE_MAP_0B pidForMode1],
             [LTOBD2PID_ENGINE_RPM_0C pidForMode1],
             [LTOBD2PID_VEHICLE_SPEED_0D pidForMode1],
             [LTOBD2PID_TIMING_ADVANCE_0E pidForMode1],
             [LTOBD2PID_INTAKE_TEMP_0F pidForMode1],
             [LTOBD2PID_MAF_FLOW_10 pidForMode1],
             [LTOBD2PID_THROTTLE_11 pidForMode1],
             [LTOBD2PID_SECONDARY_AIR_STATUS_12 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSORS_PRESENT_2_BANKS_13 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_1_SENSOR_0_14 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_1_SENSOR_1_15 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_1_SENSOR_2_16 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_1_SENSOR_3_17 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_1_SENSOR_4_18 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_1_SENSOR_5_19 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_1_SENSOR_7_1B pidForMode1],
             [LTOBD2PID_OBD_STANDARDS_1C pidForMode1],
             [LTOBD2PID_OXYGEN_SENSORS_PRESENT_4_BANKS_1D pidForMode1],
             [LTOBD2PID_AUX_INPUT_1E pidForMode1],
             [LTOBD2PID_RUNTIME_1F pidForMode1],
             [LTOBD2PID_DISTANCE_WITH_MIL_21 pidForMode1],
             [LTOBD2PID_FUEL_RAIL_PRESSURE_22 pidForMode1],
             [LTOBD2PID_FUEL_RAIL_GAUGE_PRESSURE_23 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_0_24 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_1_25 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_2_26 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_3_27 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_4_28 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_5_29 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_6_2A pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_2_SENSOR_7_2B pidForMode1],
             [LTOBD2PID_COMMANDED_EGR_2C pidForMode1],
             [LTOBD2PID_EGR_ERROR_2D pidForMode1],
             [LTOBD2PID_COMMANDED_EVAPORATIVE_PURGE_2E pidForMode1],
             [LTOBD2PID_FUEL_TANK_LEVEL_2F pidForMode1],
             [LTOBD2PID_WARMUPS_SINCE_DTC_CLEARED_30 pidForMode1],
             [LTOBD2PID_DISTANCE_SINCE_DTC_CLEARED_31 pidForMode1],
             [LTOBD2PID_EVAP_SYS_VAPOR_PRESSURE_32 pidForMode1],
             [LTOBD2PID_ABSOLUTE_BAROMETRIC_PRESSURE_33 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_0_34 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_1_35 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_2_36 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_3_37 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_4_38 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_5_39 pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_6_3A pidForMode1],
             [LTOBD2PID_OXYGEN_SENSOR_INFO_3_SENSOR_7_3B pidForMode1],
             [LTOBD2PID_CATALYST_TEMP_B1S1_3C pidForMode1],
             [LTOBD2PID_CATALYST_TEMP_B2S1_3D pidForMode1],
             [LTOBD2PID_CATALYST_TEMP_B1S2_3E pidForMode1],
             [LTOBD2PID_CATALYST_TEMP_B2S2_3F pidForMode1],
             [LTOBD2PID_CONTROL_MODULE_VOLTAGE_42 pidForMode1],
             [LTOBD2PID_ABSOLUTE_ENGINE_LOAD_43 pidForMode1],
             [LTOBD2PID_AIR_FUEL_EQUIV_RATIO_44 pidForMode1],
             [LTOBD2PID_RELATIVE_THROTTLE_POS_45 pidForMode1],
             [LTOBD2PID_AMBIENT_TEMP_46 pidForMode1],
             [LTOBD2PID_ABSOLUTE_THROTTLE_POS_B_47 pidForMode1],
             [LTOBD2PID_ABSOLUTE_THROTTLE_POS_C_48 pidForMode1],
             [LTOBD2PID_ACC_PEDAL_POS_D_49 pidForMode1],
             [LTOBD2PID_ACC_PEDAL_POS_E_4A pidForMode1],
             [LTOBD2PID_ACC_PEDAL_POS_F_4B pidForMode1],
             [LTOBD2PID_COMMANDED_THROTTLE_ACTUATOR_4C pidForMode1],
             [LTOBD2PID_TIME_WITH_MIL_4D pidForMode1],
             [LTOBD2PID_TIME_SINCE_DTC_CLEARED_4E pidForMode1],
             [LTOBD2PID_MAX_VALUE_INTAKE_MAP_4F pidForMode1],
             [LTOBD2PID_MAX_VALUE_MAF_AIR_FLOW_RATE_50 pidForMode1],
             [LTOBD2PID_FUEL_TYPE_51 pidForMode1],
             [LTOBD2PID_ETHANOL_FUEL_52 pidForMode1],
             [LTOBD2PID_ABSOLUTE_EVAP_SYSTEM_VAPOR_PRESSURE_53 pidForMode1],
             [LTOBD2PID_EVAP_SYSTEM_VAPOR_PRESSURE_54 pidForMode1],
             //55
             //56
             //57
             //58
             [LTOBD2PID_FUEL_RAIL_ABSOLUTE_PRESSURE_59 pidForMode1],
             [LTOBD2PID_RELATIVE_ACCELERATOR_PEDAL_POSITION_5A pidForMode1],
             [LTOBD2PID_HYBRID_BATTERY_PERCENTAGE_5B pidForMode1],
             [LTOBD2PID_ENGINE_OIL_TEMP_5C pidForMode1],
             [LTOBD2PID_FUEL_INJECTION_TIMING_5D pidForMode1],
             [LTOBD2PID_ENGINE_FUEL_RATE_5E pidForMode1],
             [LTOBD2PID_SUPPORTED_EMISSION_REQUIREMENTS_5F pidForMode1],
             //60
             [LTOBD2PID_ENGINE_TORQUE_DEMANDED_61 pidForMode1],
             [LTOBD2PID_ENGINE_TORQUE_PERCENTAGE_62 pidForMode1],
             [LTOBD2PID_ENGINE_REF_TORQUE_63 pidForMode1]
             //64-C0
             ].mutableCopy;
}
