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
struct SpecialComponentsUIContextGrayscale0300 {
  @State select: boolean = true;
  private iconStr: ResourceStr = $r('app.media.icon');
  private iconStr2: ResourceStr = $r('app.media.icon');

  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: '复制', labelInfo: 'Ctrl+C' })
      MenuItem({ content: '粘贴', labelInfo: 'Ctrl+V' })
    }
  }

  @Builder
  MyMenu(){
    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(-10)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(-1)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(0)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(0.2)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(0.5)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(0.8)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(1)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(1.5)

    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项' })
        .enabled(false)
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
        endIcon: this.iconStr2,
        builder: ():void=>this.SubMenu()
      })
      MenuItemGroup({ header: '小标题' }) {
        MenuItem({
          startIcon: this.iconStr,
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
        MenuItem({
          startIcon: $r('app.media.app_icon'),
          content: '菜单选项',
          endIcon: this.iconStr2,
          builder: ():void=>this.SubMenu()
        })
      }
      MenuItem({
        startIcon: this.iconStr,
        content: '菜单选项',
      })
    }
    .grayscale(100)
  }

  build() {
    Row() {
      Column() {
        Text('click to show menu')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .bindMenu(this.MyMenu)
      .width('100%')
    }
    .height('100%')
  }
}
