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
/**
 * @id CLS_09_09_020_RUNTIME_SECONDARY_CTOR
 * @expect runtime
 * @section 9.9.1
 */
class Pt3D { x: int = 0; y: int = 0; z: int = 0; constructor(x: int, y: int, z: int) { this.x = x; this.y = y; this.z = z } constructor() { this(1, 2, 3) } }
function main(): void { let p: Pt3D = new Pt3D(); if (p.x != 1 || p.y != 2 || p.z != 3) { throw new Error("fail") } console.log("verified") }
