package com.example.willrempel.coffee;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Spinner;
import android.widget.TextView;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;


public class FindCoffeeActivity extends AppCompatActivity {
    private CoffeeShop myCoffeeShop=new CoffeeShop();

    public void findCoffee(View view) {
        Spinner crowdSpinner = (Spinner) findViewById(R.id.spinner);
        String crowd = String.valueOf(crowdSpinner.getSelectedItem());
        myCoffeeShop.setCoffeeShop(crowd);
        String suggestedCoffeeShop = myCoffeeShop.getCoffeeShop();
        String suggestedCoffeeShopURL = myCoffeeShop.getCoffeeShopURL();
        System.out.println(suggestedCoffeeShop);
        System.out.println(suggestedCoffeeShopURL);
        Intent intent = new Intent(this, ReceiveCoffeeActivity.class);
        startActivity(intent);
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_coffee);
    }






}