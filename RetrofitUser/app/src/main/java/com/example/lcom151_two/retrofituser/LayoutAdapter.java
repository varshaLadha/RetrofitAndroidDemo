package com.example.lcom151_two.retrofituser;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class LayoutAdapter extends BaseAdapter {

    private Context context;
    ArrayList<String> img;
    ArrayList<String> name;

    public LayoutAdapter(Context context, ArrayList<String> name,ArrayList<String> img){
        this.context=context;
        this.name=name;
        this.img=img;
    }

    @Override
    public int getCount() {
        return name.size();
    }

    @Override
    public Object getItem(int position) {
        return null;
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        TextView uname;
        ImageView iview;
        try{
            convertView= LayoutInflater.from(context).inflate(R.layout.customgrid,null);
            uname=convertView.findViewById(R.id.name);
            iview=convertView.findViewById(R.id.profile);

            uname.setText(name.get(position));
            Picasso.with(context)
                    .load(img.get(position))
                    .into(iview);

            return convertView;
        }catch (Exception e){
            e.printStackTrace();
        }
        return convertView;
    }
}
