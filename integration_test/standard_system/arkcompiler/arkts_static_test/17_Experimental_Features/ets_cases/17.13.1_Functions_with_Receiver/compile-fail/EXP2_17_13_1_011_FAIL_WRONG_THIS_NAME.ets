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
 * @id EXP2_17_13_1_011_FAIL_WRONG_THIS_NAME
 * @expect compile-fail
 * @section 17.13.1
 * @design 接收者参数名称必须是 "this"，使用其他名称应编译失败（self 不会被视为接收者）
 * @note 反向用例：验证该场景应产生编译时错误 ESE0087
 */
class MyItem { public id: number = 0 }
function getId(self: MyItem): number { return self.id }
function testWrongThisName(): void {
  let it: MyItem = new MyItem(); it.id = 100
  let result: number = it.getId()
}
