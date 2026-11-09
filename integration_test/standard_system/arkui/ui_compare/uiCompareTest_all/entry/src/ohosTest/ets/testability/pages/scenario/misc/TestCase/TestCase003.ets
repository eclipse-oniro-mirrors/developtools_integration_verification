/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import XComponentContext from './interface/XComponentContext'

@Entry
@Component
struct TestCase003 {
  @State name: string = 'TestCase003';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  private xComponentContext: XComponentContext | undefined = undefined;
  @State currentStatus: string = 'init';

   build() {
     Row() {
       Column() {
         TextInput({ placeholder: `${this.name}: TextInput` })
           .id(this.name + '_001')

         Search({ placeholder: `${this.name}: Search` })
           .id(this.name + '_002')

         RichEditor(this.options)
           .onReady(() => {
             this.controller.addTextSpan(`${this.name}: RichEditor`, {
               style: {
                 fontColor: Color.Black,
                 fontSize: 15
               }
             })
           })
           .id(this.name + '_003')

         XComponent({
           id: this.name + '_004',
           type: XComponentType.SURFACE,
         })
           .height('20%')
           .focusable(true)
           .focusOnTouch(true)
           .id(this.name + '_004')
       }
       .width('100%')
       .height('100%')
     }
   }
 }