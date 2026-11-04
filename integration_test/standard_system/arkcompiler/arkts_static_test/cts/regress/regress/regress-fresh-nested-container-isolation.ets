/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

class ArrayHolder {
  public foo: int[] = [];
}

class PropertyHolder {
  public bar: int | undefined = undefined;
}

class ObjectHolder {
  public foo: PropertyHolder = new PropertyHolder();
}

function makeArrayInObject(): ArrayHolder {
  return new ArrayHolder();
}

function makeObjectInObject(): ObjectHolder {
  return new ObjectHolder();
}

function makeObjectInArray(): PropertyHolder[] {
  return [new PropertyHolder()];
}

function makeArrayInArray(): int[][] {
  return [[]];
}

function main(): void {
  const firstArrayObject = makeArrayInObject();
  firstArrayObject.foo.push(5);
  const secondArrayObject = makeArrayInObject();
  arktest.assertEQ(0, secondArrayObject.foo.length);

  const firstNestedObject = makeObjectInObject();
  firstNestedObject.foo.bar = 1;
  const secondNestedObject = makeObjectInObject();
  arktest.assertEQ('undefined', typeof secondNestedObject.foo.bar);

  const firstObjectArray = makeObjectInArray();
  firstObjectArray[0].bar = 1;
  const secondObjectArray = makeObjectInArray();
  arktest.assertEQ('undefined', typeof secondObjectArray[0].bar);

  const firstNestedArray = makeArrayInArray();
  firstNestedArray[0].push(5);
  const secondNestedArray = makeArrayInArray();
  arktest.assertEQ(0, secondNestedArray[0].length);
}
