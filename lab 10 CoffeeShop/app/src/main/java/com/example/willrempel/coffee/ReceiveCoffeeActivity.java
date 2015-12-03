package com.example.willrempel.coffee;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import java.net.URL;

public class ReceiveCoffeeActivity extends AppCompatActivity {



    private String coffeeshop;
    private String coffeeShopURL;


    public void loadWebSite(View view){
        Intent intent=new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(coffeeShopURL));
        startActivity(intent);




    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receive_coffee);

        Intent intent=getIntent();
        coffeeshop=intent.getStringExtra("coffeeShopName");
        coffeeShopURL=intent.getStringExtra("coffeeShopURL");
        System.out.println(coffeeshop);
        System.out.println(coffeeShopURL);
        TextView messageView=(TextView)findViewById(R.id.coffeeShopTextView);
        messageView.setText("You should check out " + coffeeshop);

    }
}
