
import java.io.IOException;
import java.util.StringTokenizer;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
public class MapperIndex extends Mapper<LongWritable,Text,Text,Text> {
    private Text keyInfo = new Text();
    private Text valueInfo = new Text();

    private FileSplit split;

    protected void map(LongWritable key,Text value,Mapper<LongWritable,Text,Text,Text>.Context context) throws  IOException, InterruptedException{
        this.split = (FileSplit)context.getInputSplit();

        StringTokenizer tokenizer = new StringTokenizer(value.toString());

        while (tokenizer.hasMoreTokens()){
            String filenameWithExtension = this.split.getPath().getName();

            int lastDotIndex= filenameWithExtension.lastIndexOf('.');

            String filename=filenameWithExtension.substring(0,lastDotIndex);

            this.keyInfo.set(tokenizer.nextToken()+"@"+filename);

            this.valueInfo.set("1");

            context.write(this.keyInfo, this.valueInfo);
        }
    }
}