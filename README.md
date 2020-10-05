# 新功能引导组件

## 动态示例

<img src="./media/HLBGuide-Example.gif" width="50%" height="50%">

## 静态示例

<img src="./media/HLBGuide-Example.jpg" width="50%" height="50%">

## 集成 HLBGuide

在 Podfile 中添加：  

```
pod 'HLBGuide'
```

## HLBGuide 的使用方法

由于要自定义会话框的 UI，请创建 `HLBFocusedWithDialogViewController` 和 `HLBDialogView` 的子类，在其中添加自定义 UI 及其点击事件。如示例中的 `MyFocusedWithDialogViewController` 和 `MyDialogView`。  

需要注意的是， `HLBDialogView` 子类的控件需添加到的 `contentView` 中。

<img src="./media/subclass-example.jpg" width="50%" height="50%">

然后就可以按下述步骤添加和展示引导页了：

#### 创建引导页

初始化自定义的引导页，并遵守和实现 `HLBFocusedWithDialogViewControllerDelegate` 代理，以将自定义会话框的 `Class` 传入。

#### 将创建好的引导页添加到 `HLBFocusedWithDialogManager` 中

```
[[HLBFocusedWithDialogManager sharedInstance] addFocusedWithDialogVC:focusedWithDialogVC];
```

#### 最后开始展示引导页

```
[[HLBFocusedWithDialogManager sharedInstance] show];
```

#### 说明

详细的使用示例可参考 `HLBGuideExample` 示例工程中的 `ExampleViewController.m`。

## 原理讲解：示例 app 中 UI 的层级结构

#### 总览

<img src="./media/reveal-all.jpg" width="50%" height="50%">

在新建的 `window` 上，有两个子 view，一个是带透明镂空的 `HLBFocusedView`；另一个是带三角形指示器的 `MyDialogView`，它继承自 `HLBDialogView`。  

此 `window` 的 `rootViewController` 为当前引导页对应的控制器 `MyFocusedWithDialogViewController`，它继承自组件中的 `HLBFocusedWithDialogViewController`，管理着上述的 `HLBFocusedView` 和 `MyDialogView`。   

#### HLBFocusedView

带透明镂空的蒙层，是使用 `UIBezierPath` 的 `bezierPathByReversingPath` 对矩形做的反向路径绘制。  

它可直接使用，无需自定义。  

<img src="./media/reveal-focusedView.jpg" width="50%" height="50%">

#### MyDialogView

带三角形指示器的会话框（由于三角形是在 layer 上绘制的，所以在 reveal 中没有显示）。  

`MyDialogView` 继承自 `HLBDialogView`，子类可在 `contentView` 上添加自定义控件（如本示例中的 Label 和 Button）。

<img src="./media/reveal-dialogView.jpg" width="50%" height="50%">
