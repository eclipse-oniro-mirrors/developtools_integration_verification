/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: super_reference_resolution
// description: super.method() resolves the method on the superclass and preserves the receiver (this)

class X {
  method(): X {
    return this;
  }
}

class Y extends X {
  method(): Y {
    return super.method() as Y;
  }
}

function main(): void {
  let y = new Y();
  // super.method() invoked on a Y instance returns that same instance
  arktest.assertTrue(y.method() === y);
}
