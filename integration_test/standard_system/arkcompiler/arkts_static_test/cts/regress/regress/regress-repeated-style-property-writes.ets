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

class StyleMock {
  public display: String = '';
  public backgroundColor: String = '';
  public color: String = '';
  public borderBottomColor: String = '';
}

class ElementMock {
  public style: StyleMock = new StyleMock();
}

class DocumentMock {
  getElementById(_id: String): ElementMock {
    return new ElementMock();
  }
}

const documentMock: DocumentMock = new DocumentMock();

function writeStyles(p0: int, p1: String, p2: int, p3: int): void {
  documentMock.getElementById(p1 + p0).style.display = '';
  documentMock.getElementById(p1 + '' + p0).style.backgroundColor = '';
  documentMock.getElementById(p1 + '' + p0).style.color = '';
  documentMock.getElementById(p1 + '' + p0).style.borderBottomColor = '';
  for (let i: int = p3; i <= p2; i++) {
    if (i != p0) {
      documentMock.getElementById(p1 + i).style.display = '';
      documentMock.getElementById(p1 + '' + i).style.backgroundColor = '';
      documentMock.getElementById(p1 + '' + i).style.color = '';
      documentMock.getElementById(p1 + '' + i).style.borderBottomColor = '';
    }
  }
}

function main(): void {
  writeStyles(1, 'xxx', 10000, 1);
}
