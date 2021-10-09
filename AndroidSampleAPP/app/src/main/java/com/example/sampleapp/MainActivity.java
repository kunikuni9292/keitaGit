package com.example.sampleapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    String[] test = {
            "田村",
            "タムラ",
            "たむら"
    };
    String[] goriraUrl = {
            "https://www.google.com/?hl=ja",
            "https://www.google.com/?hl=ja",
            "https://www.google.com/?hl=ja"
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // ListViewに表示するリスト項目をArrayListで準備する
        List<Map<String, String>> data = new ArrayList<Map<String, String>>();
        for (int i=0; i<test.length; i++){
            Map<String, String> item = new HashMap<String, String>();
            item.put("test", test[i]);
            item.put("goriraUrl", goriraUrl[i]);
            data.add(item);
        }



        //リストを起動する為に必要な情報をインスタンス化
        SimpleAdapter adapter = new SimpleAdapter(
                //①どの画面で
                this, data,
                //②どのような表示で
                android.R.layout.simple_list_item_2,
                //③なんの情報(test)を
                new String[] { "test", "goriraUrl" },
                new int[] { android.R.id.text1, android.R.id.text2}
        );
        //ListViewへadapterを送信して、画面に表示させる
        ((ListView)findViewById(R.id.listview)).setAdapter(adapter);

        ((ListView)findViewById(R.id.listview)).setOnItemClickListener(
                new AdapterView.OnItemClickListener() {
                    @Override   //クリックした時に動作させたい処理を記載
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        //URLを渡してブラウザを起動する方法
                        Uri uri = Uri.parse(goriraUrl[position]);
                        Intent i = new Intent(Intent.ACTION_VIEW,uri);
                        startActivity(i);
                    }
                }
        );

    }
}