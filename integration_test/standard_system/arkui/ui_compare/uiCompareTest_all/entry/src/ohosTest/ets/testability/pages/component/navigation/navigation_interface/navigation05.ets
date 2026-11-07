/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
export struct Navigation05 {
  stack: NavPathStack = new NavPathStack();
  @State mode:NavigationMode = NavigationMode.Stack;
  @State titleMode:NavigationTitleMode = NavigationTitleMode.Free;

  build() {
    Column(){
      Navigation(this.stack) {
        Stack({ alignContent: Alignment.Center }) {
          Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
            .id('nav05PushPageThree')
            .width('80%')
            .height(40)
            .margin(20)
            .onClick(() => {
              this.stack.pushPath({ name: 'pageThree' });
            })
        }
      }
      .width('100%')
      .height('60%')
      .navDestination(pageThreeBuilder)
      .title('Main Page')
      .titleMode(NavigationTitleMode.Mini)
    }
    .width('100%')
    .height('100%')
  }
}

@Builder
export function pageThreeBuilder(name: string, param: Object) {
  PageThreeComponent();
}

@Component
export struct PageThreeComponent {
  @State eventStr: string = '';
  @State name: string = 'pageThree';
  @State destWidth: string = '100%';
  stack: NavPathStack = new NavPathStack();
  @State barColor: string = '#FF0000';
  @State y: string = '0';

  build() {
    NavDestination() {
      Column() {
        Text(' pageThree event: ' + this.eventStr)

        Button('push next page', { stateEffect: true, type: ButtonType.Capsule })
          .id('nav05PushPageNine')
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.stack.pushPath({ name: 'pageOne' });
          })

        Button('ChangeSystemBarStyle')
          .margin({top:30})
          .height(40)
          .id('nav05ChangeSystemBarStyle')
          .onClick(()=>{
            this.barColor = '#FFFF00';
          })

      }
      .size({ width: '100%', height: '100%' })
    }
    .systemBarStyle({statusBarContentColor:this.barColor})
    .onAppear(() => {
      this.eventStr += '<onAppear>';
    })
    .onDisAppear(() => {
      this.eventStr += '<onDisAppear>';
    })
    .onShown(() => {
      this.eventStr += '<onShown>';
    })
    .onHidden(() => {
      this.eventStr += '<onHidden>';
    })
    .onWillAppear(() => {
      this.eventStr += '<onWillAppear>';
    })
    .onWillDisappear(() => {
      this.eventStr += '<onWillDisappear>';
    })
    .onWillShow(() => {
      this.eventStr += '<onWillShow>';
    })
    .onWillHide(() => {
      this.eventStr += '<onWillHide>';
    })
    .title(this.name)
    .translate({ y: this.y })
    .onReady((context) => {
      this.name = context.pathInfo.name;
      this.stack = context.pathStack;
    })
  }
}

