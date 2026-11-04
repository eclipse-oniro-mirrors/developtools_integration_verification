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
enum Color:CaseIterable{case red,green,blue}
c(Color.allCases.count==3,"swift allCases length")
c(String(describing:Color.green)=="green","swift String(describing:) analog to getName")
c(true,"Swift has no fromValue/getValueOf/values built-in N/A")
print("SUMMARY pass=\(p) fail=\(f)");if f != 0{exit(1)}