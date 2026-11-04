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
 * @id CLS_09_04_001_PASS_STATIC_INSTANCE_SAME_NAME
 * @expect compile-pass
 * @section 9.4
 * @design 类中static成员和instance成员可以同名（不同scope�?
 * @note 正向用例：spec规定static和instance属于两个不同的scope
 */
class DataHolder {
  static value: int = 100
  value: string = "instance"
}
