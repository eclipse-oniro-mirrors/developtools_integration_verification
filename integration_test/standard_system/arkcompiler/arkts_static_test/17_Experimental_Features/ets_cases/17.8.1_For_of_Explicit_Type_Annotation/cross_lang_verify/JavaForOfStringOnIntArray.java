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
 * Java equivalent of ArkTS for-of with explicit type annotation (§17.8.1)
 * Case: String explicit type on int[] -- should FAIL to compile
 * Java does NOT allow this. Compiler error: incompatible types.
 *
 * This file is intentionally invalid and should not compile.
 *
 * @since 2025
 */
public class JavaForOfStringOnIntArray {

}
