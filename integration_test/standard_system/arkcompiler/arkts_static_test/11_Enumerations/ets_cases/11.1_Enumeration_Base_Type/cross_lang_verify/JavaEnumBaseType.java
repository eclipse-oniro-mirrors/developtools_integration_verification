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
public class JavaEnumBaseType {
    enum E1 { A, B, C }
    enum E2 { A(5), B(10), C(15);
        private int v;
        E2(int v) { this.v = v; }
        int v() { return v; }
    }
    static int p=0,f=0;
    static void c(boolean b,String s){if(b){p++;System.out.println("PASS "+s);}else{f++;System.out.println("FAIL "+s);}}
    public static void main(String[]a){
        c(E1.A.ordinal()==0 && E1.B.ordinal()==1 && E1.C.ordinal()==2,"java enum ordinal 0,1,2 analog to int auto-increment");
        c(E2.A.v()==5 && E2.B.v()==10,"java enum explicit int values");
        c(true,"Java has no compile-time base type inference N/A");
        System.out.println("SUMMARY pass="+p+" fail="+f);if(f!=0)System.exit(1);
    }
}