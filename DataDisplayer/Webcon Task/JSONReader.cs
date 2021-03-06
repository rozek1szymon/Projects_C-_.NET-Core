﻿using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Schema;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Webcon_Task.Builder;

namespace Webcon_Task
{
    
    class JSONReader : Builder.IBuilder
    {
        public JObject jObject;
        public  StreamReader file;
        public JsonTextReader reader;
        public Product product;


        //  Without validation
        public void Construct(string Pathfile)
        {
            
            product = new Product();
            file = File.OpenText(Pathfile);
            reader = new JsonTextReader(file);
            jObject = new JObject();
            jObject = (JObject)JToken.ReadFrom(reader);
            product.Data.Add("Our Json\n" + jObject);
            
        }

        public Product BuildOutput()
        {
            return product;

        }

    }

}


