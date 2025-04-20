
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
public class ReducerIndex extends Reducer<Text,Text,Text,Text> {
    private final Text allFilesConcatValue = new Text();

    @Override
    protected void reduce(Text key, Iterable<Text> values, Context context) throws java.io.IOException ,InterruptedException{
        StringBuilder fileList = new StringBuilder("");
        for (Text value:values){
            fileList.append(value.toString()).append(";");
        }
        allFilesConcatValue.set(fileList.toString());
        context.write(key, allFilesConcatValue);
    }
}