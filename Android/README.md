# Android

## Sumário

- [Atividades e fragmentos (views e xibs)](#activity)
- [Life cicle](#lifeCicle)
- [View Elements](#viewElements)
- [View properties](#viewProperties)
- [Outlets e targets](#outlets)
- [List View (table view)](#listView)
- [Gesture Recognizer](#gesture)
- [Menu](#menu)
- [Intent (segues)](#intent)
- [Threads](#threads)
- [Service](#service)
- [Comunicação entre apps (usando broadcast)](#broadcast)
- [SQLite](#SQLite)
- [Shared Preferences (User Defaults)](#sharedPref)
- [Animação](#animation)
- [Vídeos](#video)
- [Camera](#camera)
- [Style (Reusable design)](#style)
- [Libraries (pods)](#library)
- [Criar app icon](#appIcon)
- [Publicar app (gerar apk)](#publicar)
- [Assets](#assets)
- [Atalhos](#atalhos)

<a name="activity"></a>
## Atividades e fragmentos (views e xibs)

- AndroidManifest --> tipo info.plist
- Atividade inicial --> tem a opção "Android.intent.category.Launcher" no Android Manifest
- activity.xml --> "storyboard"

Cada tela é uma atividade.

Um fragmento é um pedaço de uma atividade que pode ser reaproveitado (tipo um xib). Pode ter mais de um por atividade.

<a name="lifeCicle"></a>
## Life cicle

- View Did Load --> onCreate()
- View Will Appear --> onStart()
- View Did Appear --> onResume()
- View Will Disappear --> onPause()
- View Did Disappear --> onStop()

<a name="viewElements"></a>
## View Elements 

- label --> TextField
- text field --> EditText
- table view --> List View
- collection view --> grid layout
	- columnSpan 	--> número de colunas ocupadas pelo elemento no grid
	- rowSpan --> número de linhas
- Master detail --> master detail flow

<a name="viewProperties"></a>
## View properties

- wrap content --> fica do tamanho do conteúdo
- match parent --> fica do mesmo tamanho que o pai
- layout --> posicionamento em relação ao pai
- gravit --> posicionamento dos filhos em relação a ele (alinhamento do texto de um botão, por exemplo)

<a name="outlets"></a>
## Outlets e targets

```java

// outlet para botão ou (quase) qualquer outro elemento
Button button = (Button) findViewById(R.id.buttonId)

// outlets para fragmentos:
MyFragment fragment = (MyFragment) getSupportFragmentManager().findFragmentById(R.id.fragmentId);

// adiciona um observer para cliques no botão
button.setOnClickListener( 
	// precisa passar alguém que implementa a interface OnClickListener
	// então cria uma "closure" que faz isso
	new Button.OnClickListener() {
		// implementa a interface
		public void OnClick(View view) {
			// TODO: Handle click
		}
	}
);

// long press
// O método da interface retorna um Bool. 
// Se este for falso, ele indica que não tratou o evento, então o OnClickListener também será chamado
button.setOnLongClickListener()

```

Adicionar target no xml

```xml

// a activity ou fragmento deverá ter um método chamado myOnClickMethod
<button android:onClick="myOnClickMethod" />

```

<a name="listView"></a>
## List View (table view)

**Activity:**

```java

... onCreate( ... ) {
	...
	// array de dados do tipo T
	T[] dataArray = [ ]
	// cria um adapter com os dados e o layout (.xml)
	ListAdapter adapter = new ArrayAdapter<T>(this, android.R.layout.my_item, dataArray);
	ListView listView = (ListView) findViewById(...);
	listView.setAdapter(adapter);
	
	// did Selected Item:
	listView.setOnClickLstener(
		new AdapterView.OnItemClickLstener() {
			@Override
			public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				let data = String.valueOf( parent.getItemAtPosition(position) );
			}
		}
	)
}

```

**Custom Adapter:**

Tipo um TableViewDelegate e TableViewDataSource

```java

// pode colocar qualquer tipo no lugar de String
class MyAdapter extends ArrayAdapter<String> {
	MyAdapter(Context context, Srting[] dataArray) { 
		super(context, R.layout.my_item_layout, dataArray); 
	}
	
	// cell for row at indexPath
	@Override
	public View getView(nt position, View convertView, ViewGroup parent) {
		LayoutInflater inflater = LayoutInflater.from(getContext());
		View customView = inflater.inflate(R.layout.my_item_layout);
		
		// TODO: configurar customView da mesma forma que a gente configura uma célula no método cell for row at index path da tableView
		
		return customView;
	}
}

```

<a name="gesture"></a>
## Gesture Recognizer

Chamado de Gesture Detector no android.

Interfaces: 

- GestureDetector.OnGestureListener
- GestureDetector.OnDoubleTapListener

Criar gesture detector:

```java
GestureDetector gesture = new GestureDetectorCompat(this, this)
gesture.setOnDoubleTapListener()

```

handle:

```java
@override
public boolean onTouchEvent(MotionEvent event) {
	// passa o evento para o gesture detector tratar
	this.gestureDetector.onTouchEvent(event);
	retur super.onTouchEvent(event);
}

```

Ao lidar com os eventos, retorna true pra indicar que lidou com ele.

<a name="menu"></a>
## Menu

Layout:

```xml

// grupo de iten que só um pode ser selecionado
<group android:checkableBehavior="single">
	<item />
	<item />
</group>

```

Lidar com a seleçãode um item na Activity:

```java

@override
public boolean onOptionsItemSelected(MenuItem item) {
	// TODO: checar qual é o item pelo id e lidar com a seleção
}

```

<a name="intent"></a>
## Intent (segues)


```java
// cria o segue
Intent myIntent = new Intent(this, Destination.class);

// passa informação
myIntent.putExtra("informationKeyName", informationData);

// perform segue
myIntent.startActivity();

```

Receber informações passadas no segue:

```java

... onCreate( ... ) {
	
	Bundle infos = getIntent().getExtras()
	if (infos == null) { return }
	
	// recupera a informação a patir da chave
	let message = infos.getString("informationKeyName");
}

```

<a name="threads"></a>
## Threads

Cirar thread:

```java
Runnable r = new Runnable() {
	@Override
	public void run() {
		// TODO: perform thread action
		
		// call handler in main thread
		handler.sendEmptyMessage(0);
	}
};

Thread t = new Thread(r);
t.start();

```

Atualizando a UI na main thread:

```java
Handler h = new Handler() {
	@override
	public void handleMessage(Message m) {
		super.handleMessage(m);
		
	}
};
```

<a name="service"></a>
## Service

Pedaço de código que roda no background.


### Intent service 
new > Service > Service (Intent)

```java

public class MyClass extends IntentService {
	
	public MyIntentService() {
		super("MyClass");
	}
	
	@Override
	public void onHandleIntent(Intent intent) {
		// TODO: perform service action
	}
}

```

Iniciar o serviço:

```java

Intent i = new Intent(this, MyClass.class);
startService(i);

```

Ao usar Intent Service, ele cria outra thread automaticamente pra executar as ações.

### Service (criando manualmente)

new > Service > Service

```java

@Override
public int onStartCommand(Intent intent, int flags, int startId) {
	// TODO: criar outra thread e mandar fazer a ação do serviço
	
	// Se matar o app no meio do serviço, ele reinicia ao abrir o app
	return Service.START_STICKY
}

@Override
public void onDestroy() { }

public IBinder onBind(Intent intent) { return null; }
```

Iniciar o serviço: Mesma forma que Intent Service

## Bound Service

Conectar o app (client) ao service.

new > Service > Service.

```java

public class MyService extends Service {
	
	private final IBinder binder = new MyLocalBinder();
	
	public MyService() { }
	
	public IBinder onBind(Intent intent) { return binder; }
	
	public class MyLocalBinder extends Binder {
		MyService getService() { return MyService.this; }
	}

	// TODO: criar um método qualquer que faz a ação do serviço
}

```

Chamando o serviço dentro da activity:

```java

public class MyActivity ...  {
	MyService service;
	Boolean isBounded = false;
	
	@Override
	public void onCreate ... {
		...
		Intent i = new Intent(this, MyService.class);
		bindService(i, this.serviceConnection, Context.BIND_AUTO_CREATE);
	}
	
	private ServiceConnection serviceConnection = new Serviceconnection() {
		@Override
		public void onServiceConnected(ComponentName name, IBinder Service) {
			MyLocalBinder binder = (MyLocalBinder) service;
			this.service = binder.getService();
			isBounded = true;
		}
		
		@Override
		public void onServiceDisconnected(ComponentName name) {
			isBounded = false;
		}
	};
}

```

Feito isso, vc pode chamar os métodos do service em qualquer lugar.

<a name="broadcast"></a>
## Comunicação entre apps (usando broadcast)

**Criar broadcast:**

```java

Intent i = new Intent();
i.setAction("com.danilocharantola.sendbroadcast");
i.addFlag(Intent.FLAG_INCLUDE_STOPPED_PACKAGES);
sendBroadcast(i);

```

**Receber broadcast:**

new > other > broadcast receiver

```java

public class MyReceiver extends BroadcastReceiver {
	@Override
	public void onReceive(Context context, Intent intent) {
		// TODO: handle
	}
}
```

No Android Manifest:

```xml

<application>
	<receiver>
		<intent-filter>
			<action android:name="com.danilocharantola.sendbroadcast" />
		</intent-filter>
	</receiver>
</application>

```
<a name="SQLite"></a>
## SQLite

```java
public class MyDBHandler extends SQLiteOpenHelper{
    private static final int DATABASE_VERSION = 1;
    private static final String DATABASE_NAME = "<#element#>DB.db";
    public static final String TABLE_NAME = "<#element#>s";
    public static final String COLUMN_ID = "_id";
    public static final String COLUMN_<#ELEMENT#>NAME = "<#element#>name";

    // We need to pass database information along to superclass
    public MyDBHandler(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, DATABASE_NAME, factory, DATABASE_VERSION);
    }

	// method called only once when creating the database
    @Override
    public void onCreate(SQLiteDatabase db) {
        String query = "CREATE TABLE " + TABLE_NAME + "(" +
                COLUMN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                COLUMN_<#ELEMENT#>NAME + " TEXT " +
                ");";
        db.execSQL(query);
    }
    
    // Method called when updating the database version
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    	 // TODO: usar ALTER TABLE e outros comandos para fazer a migração corretamente
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }

    // Adiciona uma nova entrada na tabela
    public void add<#Element#>(<#Element#>s <#element#>){
        ContentValues values = new ContentValues();
        values.put(COLUMN_<#ELEMENT#>NAME, <#element#>.getName());
        SQLiteDatabase db = getWritableDatabase();
        db.insert(TABLE_NAME, null, values);
        db.close();
    }

    //Delete a <#element#> from the database
    public void delete<#Element#>(String <#element#>Name){
        SQLiteDatabase db = getWritableDatabase();
        db.execSQL("DELETE FROM " + TABLE_NAME + " WHERE " + COLUMN_<#ELEMENT#>NAME + "=\"" + <#element#>Name + "\";");
    }

    // this is goint in record_TextView in the Main activity.
    public String databaseToString(){
        String dbString = "";
        SQLiteDatabase db = getWritableDatabase();
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE 1";// why not leave out the WHERE  clause?

        //Cursor points to a location in your results
        Cursor recordSet = db.rawQuery(query, null);
        //Move to the first row in your results
        recordSet.moveToFirst();

        //Position after the last row means the end of the results
        while (!recordSet.isAfterLast()) {
            // null could happen if we used our empty constructor
            if (recordSet.getString(recordSet.getColumnIndex("<#element#>name")) != null) {
                dbString += recordSet.getString(recordSet.getColumnIndex("<#element#>name"));
                dbString += "\n";
            }
            recordSet.moveToNext();
        }
        db.close();
        return dbString;
    }

}
```

Chamar o init:

```java
MyDBHandler handler = new MyDBHandler(this, null, null, 1);

// usar os métodos normalmente depois
```

<a name="sharedPref"></a>
## Shared Preferences (User Defaults)

```java
 public void saveData() {
 	// passar o nome da sharedPreferences e o modo 
 	// (privado significa que só esse app consegue abrir ela)
    SharedPreferences data = getSharedPreferences("fileName", Context.MODE_PRIVATE);
    SharedPreferences.Editor editor = data.edit();
    // save string
    editor.putString("key", stringValue);
	// faz as mudanças
    editor.apply();
}

public void getData() {
    SharedPreferences data = getSharedPreferences("fileName", Context.MODE_PRIVATE);
    String myString = data.getString("key", "defaultValue");
}
```

<a name="animation"></a>
## Animação

[Movimento de objetos na tela](https://www.youtube.com/watch?v=n4IyvL-ACbk&list=PL6gx4Cwl9DGBsvRxJJOzG4r4k_zLKrnxl&index=34)

<a name="video"></a>
## Vídeos

[Tutorial](https://www.youtube.com/watch?v=oF9yZenJtjI&list=PL6gx4Cwl9DGBsvRxJJOzG4r4k_zLKrnxl&index=55)

<a name="camera"></a>
## Tirar fotos

Adicionar permissão no AndroidManifest:

```xml
<user-feature android:name="android.hardware.camera" android:required="true" />
```

Código para tirar a foto:

```java
public class MainActivity extends ActionBarActivity {

    static final int REQUEST_IMAGE_CAPTURE = 1;
    ImageView imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        if(!hasCamera())
            button.setEnabled(false);
    }

    // Check if the user has a camera
    private boolean hasCamera(){
        return getPackageManager().hasSystemFeature(PackageManager.FEATURE_CAMERA_ANY);
    }

    // Launching the camera when the button is pressed
    public void launchCamera(View view){
        Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        //Take a picture and pass results along to onActivityResult
        startActivityForResult(intent, REQUEST_IMAGE_CAPTURE);
    }

    // If you want to return the image taken
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK){
            //Get the photo
            Bundle extras = data.getExtras();
            Bitmap photo = (Bitmap) extras.get("data");
            imageView.setImageBitmap(photo);
        }
    }
}
```

Salvar foto:

```java
MediaStore.Images.Media.insertImage(getContentResolver(), photo, "title", "description");
```

<a name="style"></a>
## Style (Reusable design)

Criar arquivo xml com o style:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="MyStyle">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">wrap_content</item>
    </style>
    <style name="BabyBlue.BigBlue">
       <item name="android:textSize">30sp</item>
    </style>
</resources>
```

Usar o style em algum elemento:

```xml
<TextView style="@style/styleName" />
```

Fazer uma "extension" do style:

```xml
<resources>
    <style name="MyStyle"> ... </style>
    <!-- MyStyle.MyStyle2 tem todas as configurações de MyStyle e mais algumas -->
    <style name="MyStyle.MyStyle2"> ... </style>
</resources>
```
> Obs: Se colocar na tag application dentro do android manifest, ele vai setar o tema pra todas as telas do app. Se colocar na tag activity, seta só para aquela atividade.
> Obs2: O modo visual do xml não mostra o tema setado no android manifest

<a name="library"></a>
## Libraries (pods)

- Download de imagens
	- [Picasso](http://square.github.io/picasso/) 
	- [Glide](https://github.com/codepath/android_guides/wiki/Displaying-Images-with-the-Glide-Library) 
	- [ion](https://github.com/koush/ion) - Também faz download e post de jsons (É um kingfisher + alamofire)
- Anotações para simplicar criação de outlets, targets e threads
	- [AndroidAnnotations](https://github.com/androidannotations/androidannotations/wiki) - Lista com todas as anotações [aqui](https://github.com/androidannotations/androidannotations/wiki/AvailableAnnotations)
	- [Spork](https://spork.bytewelder.com/docs/4.0/Android/Annotations/BindClick.html)
- List View Sticky header
	- [StickyListHeaders](https://github.com/emilsjolander/StickyListHeaders)
- Search bar
	- [Floating Search View](https://github.com/arimorty/floatingsearchview) 

<a name="appIcon"></a>
## Criar app icon

[Tutorial](https://www.youtube.com/watch?v=ESNum4uyhEI&index=68&list=PL6gx4Cwl9DGBsvRxJJOzG4r4k_zLKrnxl&frags=wn)

<a name="publicar"></a>
## Publicar app (gerar apk)

[Tutorial](https://www.youtube.com/watch?v=z8QVkvR2Rck&index=69&list=PL6gx4Cwl9DGBsvRxJJOzG4r4k_zLKrnxl&frags=pl%2Cwn)

<a name="assets"></a>
## Assets

Ficam na pasta src > main > res > drawable

<a name="atalhos"></a>
## Atalhos

- Implementar interface: alt+insert > Implement methods
- Getter: alt+insert > getter
- Setter: atl+insert > setter
- Girar simulador: ctrl + left
- Identar: ctrl+alt+l





