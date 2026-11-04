/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// arktsid: weakref_basic
// description: WeakRef holds a weak reference to an object; deref returns the target or undefined after GC

function main(): void {
    let target: Object = {};
    let ref = new WeakRef<Object>(target);
    // Before GC, deref returns the target
    let result = ref.deref();
    arktest.assertEQ(result, target);
}
