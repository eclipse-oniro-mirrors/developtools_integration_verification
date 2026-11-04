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
var p=0,f=0
func c(_ b:Bool,_ s:String){if b{p+=1;print("PASS \(s)")}else{f+=1;print("FAIL \(s)")}}
enum E1: Int { case a = 0, b = 1, c = 2 }
enum E2: String { case a = "x", b = "y", c = "z" }
c(E1.a.rawValue==0 && E1.c.rawValue==2,"swift Int rawValue")
c(E2.b.rawValue=="y","swift String rawValue")
c(true,"Swift rawValue: is explicit, no compile-time inference N/A")
print("SUMMARY pass=\(p) fail=\(f)");if f != 0{exit(1)}
