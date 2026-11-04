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

class Article {
  public text: string;

  constructor(text: string) {
    this.text = text;
  }
}

function main(): void {
  const values: Article[] = [
    new Article('Wikip\u00e9dia est un projet d\u2019encyclop\u00e9die collective en ligne, universelle.'),
    new Article(`Wikip\u00e9dia est d\u00e9finie par des principes fondateurs. Son contenu est
 sous <b11><b20>licence <b30>Creative Commons BY-SA</b30></b20></b11>. Il peut
 \u00eatre <b12>copi\u00e9 et r\u00e9utilis\u00e9 sous la m\u00eame licence</b12>, sous r\u00e9serve d'en
 respecter les conditions..`)
  ];

  const encoded: string = JSON.stringify(values);
  const parsed: jsonx.JsonElement = JSON.parseJsonElement(encoded);

  arktest.assertEQ(values[1].text, parsed[1]['text'].asString());
}
