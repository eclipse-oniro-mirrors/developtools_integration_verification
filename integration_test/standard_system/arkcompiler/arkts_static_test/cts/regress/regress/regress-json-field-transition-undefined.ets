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

type TransitionValue = (() => int) | int | undefined;

class TransitionObject {
  public a1: double = 0.0;
  public a2: double = 0.0;
  public a3: double = 0.0;
  public a4: double = 0.0;
  public a5: double = 0.0;
  public a6: double = 0.0;
  public a7: double = 0.0;
  public a8: double = 0.0;
  public a9: double = 0.0;
  public a10: double = 0.0;
  public a11: double = 0.0;
  public a12: double = 0.0;
  public a13: double = 0.0;
  @JSONParseIgnore
  public a: TransitionValue = undefined;
  @JSONParseIgnore
  public x: int | undefined = undefined;
}

function ten(): int {
  return 10;
}

function parseTransitionObject(input: string, objectType: Type): TransitionObject {
  return JSON.parse<TransitionObject>(input, objectType) as TransitionObject;
}

function main(): void {
  const input = '{ "a1":1, "a2":1, "a3":1, "a4":1, "a5":1, "a6":1, "a7":1,' +
    ' "a8":1, "a9":1, "a10":1, "a11":1, "a12":1, "a13":1}';
  const objectType = Type.of(new TransitionObject() as Object);

  const a = parseTransitionObject(input, objectType);
  a.a = ten;

  const b = parseTransitionObject(input, objectType);
  b.a = 10;

  const c = parseTransitionObject(input, objectType);
  c.x = 10;
  arktest.assertEQ(undefined, c.a);
}
