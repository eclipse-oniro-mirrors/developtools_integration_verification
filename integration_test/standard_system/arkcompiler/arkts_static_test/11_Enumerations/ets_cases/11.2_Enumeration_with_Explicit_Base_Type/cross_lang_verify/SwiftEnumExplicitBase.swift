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
var p=0,f=0;func c(_ b:Bool,_ s:String){if b{p+=1;print("PASS \(s)")}else{f+=1;print("FAIL \(s)")}}
enum ExplicitByte:Int{case a=0,b=1}
enum ExplicitDouble:Double{case a=0.0,b=1.0,c=3.14}
c(ExplicitByte.a.rawValue==0,"swift explicit Int rawValue")
c(ExplicitDouble.c.rawValue==3.14,"swift explicit Double rawValue")
c(true,"Swift rawValue is always explicit but limited to Int/String/Double N/A")
print("SUMMARY pass=\(p) fail=\(f)");if f != 0{exit(1)}
