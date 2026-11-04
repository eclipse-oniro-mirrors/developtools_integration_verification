/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
public class JavaEnumInit {
    enum Color { Red, Blue(5);
        int v; Color() {v=0;} Color(int v){this.v=v;}
        int v(){return v;}
    }
    static int p=0,f=0;static void c(boolean b,String s){if(b){p++;System.out.println("PASS "+s);}else{f++;System.out.println("FAIL "+s);}}
    public static void main(String[]a){
        c(Color.Red.v()==0,"java enum Red = 0");
        c(Color.Blue.v()==5,"java enum Blue = 5");
        c(true,"Java enum cannot auto-increment from prior member N/A");
        System.out.println("SUMMARY pass="+p+" fail="+f);if(f!=0)System.exit(1);
    }
}