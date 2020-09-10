import React, { useContext } from "react";
import { LoaderContext } from "../_app";
import card from "../../styles/totalCard.module.scss";
import styles from "../../styles/dashboard.module.scss";
import { Layout, TotalCard } from "../../src/components";

function Dashboard() {
  const { state } = useContext(LoaderContext);

  return (
    <Layout>
      <div className={styles.Dashboard}>
        <div className={card.container}>
          <TotalCard
            name="Total Transactions"
            number={state.totalData.totalTransactions}
          />
          <TotalCard name="Total Users" number={state.totalData.totalUsers} />
          <TotalCard name="Total Groups" number={state.totalData.totalPools} />
          <TotalCard
            name="Completed Pools"
            number={state.totalData.completedPools}
          />
        </div>
        <div>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Error,
          suscipit alias amet ex rerum ea vel omnis dolore. Perferendis possimus
          veritatis facilis suscipit eaque porro ipsam blanditiis saepe. Ut, in!
          Nesciunt, mollitia. Impedit error quasi officiis, ex excepturi ad
          alias necessitatibus adipisci, quidem dolor laudantium repellat
          quibusdam neque odit vero minima omnis! Omnis eius voluptates error
          rem, ipsa aspernatur a. Totam eum dolorum dolor, illo sequi adipisci
          consequuntur culpa dolore ullam fuga temporibus perferendis eaque
          rerum asperiores nostrum ipsam aliquam exercitationem corrupti. Vero
          officiis minus iste nostrum, quam ut adipisci! Itaque culpa voluptates
          nostrum harum velit, id, ipsam quia necessitatibus veritatis molestiae
          quo. Reiciendis officia perferendis magni a ad voluptate, cum optio
          earum repellendus! Expedita ad suscipit illo nisi iure. Blanditiis
          repellat veritatis similique officia ut maxime nulla enim ducimus
          obcaecati esse nihil facere vero doloremque, voluptas alias, deserunt
          error minima consequatur. At, cumque quas explicabo culpa tenetur illo
          quasi. Impedit earum officia quos, voluptates vel iste reiciendis quia
          iure quas? Itaque provident fugiat expedita quibusdam explicabo
          sapiente modi optio quaerat, recusandae esse nihil reiciendis! Id
          molestias suscipit totam unde. Animi, nihil, unde molestias temporibus
          ut sapiente perferendis natus consequuntur maiores quam optio impedit
          laboriosam sint consectetur et architecto eligendi. Assumenda dolorum
          aliquid dolores magnam laborum temporibus deleniti at quidem? Ipsam
          vel, doloremque praesentium omnis architecto fugiat delectus aliquam
          aut unde consectetur animi id esse excepturi asperiores possimus ab
          autem nesciunt quam magni reprehenderit sint inventore voluptatibus
          dignissimos. Inventore, facere. Cum quam nam neque error tempore
          laudantium, ullam molestias aliquam, totam ea assumenda alias, amet
          debitis ipsum beatae voluptatibus pariatur cupiditate nostrum sit unde
          exercitationem deleniti! Molestias, quos excepturi. Mollitia. Ab nemo
          fugit recusandae nobis, quae sapiente necessitatibus sint, provident
          animi quidem corrupti minima accusamus porro ipsam voluptate
          perferendis! At ullam officia dolorum architecto eos exercitationem,
          rerum voluptatibus nulla earum. Sed ad alias suscipit voluptate a
          aliquam cum aliquid nihil in architecto recusandae excepturi unde nemo
          sunt temporibus nesciunt commodi, dicta dolorum veniam at vero rerum
          distinctio eaque rem! Perspiciatis. Provident, debitis reprehenderit
          qui vel rerum veritatis consequatur beatae corporis rem quas
          doloremque assumenda nam esse facilis ipsum doloribus molestias cum
          autem necessitatibus sequi quibusdam facere non suscipit! Magni,
          pariatur! Aut ratione tempore recusandae praesentium. Iusto mollitia
          quo dolores ducimus quaerat. Amet minus quisquam eaque? Hic odio quae
          dicta? In doloribus veniam, iusto ullam deserunt molestiae. Dicta vel
          mollitia placeat? Quas qui sit magni, labore voluptatibus laborum
          quidem quis fuga nam cupiditate accusantium fugit ea dicta harum! Sint
          incidunt nesciunt neque, pariatur cupiditate quis vero ex doloribus
          eaque aspernatur ab! Omnis, repudiandae minima quibusdam laborum modi
          fuga provident sequi autem veritatis error repellendus deserunt sint
          ipsam vitae at, nihil temporibus recusandae, tempore adipisci
          consectetur amet quis deleniti molestias. Praesentium, ut! Ipsum
          repellendus voluptates magnam dolorem itaque, omnis voluptatem
          corporis a, provident delectus ea maiores deserunt. Pariatur
          veritatis, necessitatibus impedit fugiat accusamus minima placeat
          eaque, asperiores eligendi ducimus vel, ea odit. Animi architecto
          suscipit assumenda dolorum nostrum temporibus? Voluptatum nemo sint
          numquam, facere nostrum repellat quos ipsam, tempora sapiente deleniti
          ratione vitae adipisci! Incidunt tenetur nam quis iure blanditiis
          accusamus unde? Vero, est nulla porro labore eveniet nisi consectetur
          atque eos asperiores dolore saepe hic illum distinctio natus iusto
          nostrum itaque odio veniam pariatur repudiandae ad. Iure, voluptatem
          qui! Doloribus, necessitatibus. Rem possimus optio ad quod aspernatur,
          tempora mollitia quae dolorum officiis aliquid assumenda dolore illum
          obcaecati cum rerum quo nisi voluptatem recusandae perferendis fuga
          sit, velit minima? Temporibus, corporis quae? Culpa repellendus, fuga
          ipsam vitae ipsum cupiditate dolorem quidem corrupti, vel praesentium
          enim iste delectus et distinctio ad, sint velit. Vel hic commodi quae
          sequi qui! Ex maiores ratione voluptatibus! Consectetur architecto est
          incidunt saepe facere alias adipisci officia dignissimos reprehenderit
          voluptatum dicta nulla a quasi tempora, fuga optio voluptas
          accusantium corrupti molestiae aperiam. Expedita sequi mollitia
          assumenda earum facilis? Cumque, accusamus? Alias dolorem magnam
          distinctio dolores. Dolor laudantium tempore eaque quas quidem,
          incidunt itaque, molestiae animi laborum iure temporibus consectetur
          fugiat a quod nobis quibusdam asperiores ipsa doloremque blanditiis!
          Nisi sunt voluptatum odio porro, ab ullam magnam nesciunt, doloremque
          iusto cupiditate autem tenetur sapiente recusandae, eius rem molestias
          repellat voluptas excepturi omnis possimus? Aspernatur veritatis ea
          minima sint eligendi? Ratione reiciendis maiores quibusdam tenetur
          quas assumenda repellendus voluptatibus doloribus asperiores, iusto
          labore numquam dolor dignissimos eos eum delectus sapiente
          accusantium. Repudiandae culpa est, atque inventore totam id explicabo
          optio. Provident repellat omnis laborum esse optio officia
          consequuntur magnam, iste architecto quae exercitationem recusandae
          tempore autem nulla distinctio quibusdam odio. Facilis qui eos
          veritatis perspiciatis optio consectetur laborum expedita voluptates.
          Veniam eos iusto nihil! Libero doloribus nam rerum ut non, impedit
          accusantium tenetur expedita delectus repellendus vitae amet, dolore,
          quis velit autem numquam dignissimos ratione molestiae ea! Quod, nulla
          debitis. Saepe ea veniam fuga adipisci praesentium quia quasi odio
          dolore commodi maiores delectus voluptatum enim quibusdam omnis vitae
          quos placeat accusamus, asperiores suscipit! Dolorum, a? Voluptatem
          suscipit nulla veritatis dolorum? Sed pariatur blanditiis aliquam
          earum laborum voluptatum quasi veniam soluta, sunt tempore consectetur
          ipsa, amet a dolor! Magni, accusantium! Porro cupiditate soluta
          asperiores! Quam, totam eum? Ad, molestiae iusto? Commodi? Eius sed
          quae cum reprehenderit harum similique reiciendis facilis asperiores,
          facere nemo voluptate, enim unde est quisquam voluptates suscipit
          saepe amet natus exercitationem ad ex porro? Pariatur, cum dolores!
          Nostrum? Reprehenderit minus earum maxime voluptates quas dicta
          consequatur magnam nobis? Dolore excepturi aliquam, ea expedita iste
          illo voluptatem quis officiis eos dignissimos nobis delectus, aperiam,
          impedit labore suscipit minus animi? Qui numquam perspiciatis totam
          praesentium at ipsam vitae maiores quibusdam labore? Maxime, amet
          aperiam ipsam doloremque atque odio animi deleniti vero recusandae
          aspernatur dolor dolorem odit. Quidem a obcaecati doloremque!
          Voluptates saepe fugiat provident, iste rerum sunt rem, esse modi
          consequuntur voluptatibus vero repellendus doloremque beatae
          recusandae sequi nemo, qui deserunt est harum tempora ex ullam? Totam
          quae hic earum. Nam quae quis aliquam adipisci tempore ad expedita
          debitis, cumque perferendis temporibus, quidem nobis quibusdam aut
          deleniti harum fugiat error eum amet consequuntur minima. Consectetur
          ab repellat maxime error non. Iure, inventore aut facere fugiat,
          sapiente cumque tempora aperiam error adipisci repudiandae debitis ea
          temporibus vero fugit ab a soluta exercitationem deleniti ducimus est
          unde officia alias laborum? Officia, corrupti!
        </div>
      </div>
    </Layout>
  );
}

export default Dashboard;
