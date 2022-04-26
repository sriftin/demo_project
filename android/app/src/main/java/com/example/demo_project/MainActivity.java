package com.example.demo_project;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import java.util.*;
import java.util.ArrayList;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "phone/number";
    private static final String USER_CHANNEL = "user/user";
    private static final String EXISTING_USER = "user/existing";
    static Contacts contact1 = new Contacts("528027113","סער","ריפטין","saar","1");

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("passNumber")) {
                                String value = "0";
                                Map<String, Object> arguments = call.arguments();
                                String number = (String) arguments.get("phoneNumber");
                                if (contact1.getNumbers().contains(number)){
                                    value = "1";
                                }else {
                                    value = "0";
                                }
                                result.success(value);
                            }
                        }
                );

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), USER_CHANNEL)
                .setMethodCallHandler(
                        ((call, result) -> {
                            if (call.method.equals("contact")) {
                                Map<String, Object> arguments = call.arguments();
                                final String phoneNumber = (String) arguments.get("phoneNumber");
                                 final String fName = (String) arguments.get("firsName");
                                 final String lName = (String) arguments.get("lastName");
                                 final String email = (String) arguments.get("eMail");
                                 final String identification = (String) arguments.get("id");
                                Contacts contact = new  Contacts(phoneNumber,fName,lName,email,identification);
                                result.success(contact.getFirstName()+" "+contact.getLastName());
                            }
                        })
                );
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), EXISTING_USER)
                .setMethodCallHandler(
                        ((call, result) -> {
                            if (call.method.equals("existing")){
                                result.success(contact1.getFirstName().toString()+ " "+ contact1.getLastName().toString());
                            }
                        })
                );


    }

}


